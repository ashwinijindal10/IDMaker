var FONTSTYLES = [
            { text: 'Normal', value: 'normal' },
            { text: 'Bold', value: 'bold' },
            { text: 'Italic', value: 'italic' }
];

var FONTS = [
            { text: 'Arial', value: 'Arial' },
            { text: 'Times New Roman', value: 'Times New Roman' },
            { text: 'Courier New', value: 'Courier New' }
]


angular.module("app", ["blockUI", "app.ctrl", "ngStorage", "imageupload", "app.directive"])
    .config(function ($httpProvider) {
        $httpProvider.defaults.headers.post = {};
        $httpProvider.defaults.headers.post["Content-Type"] = "application/json; charset=utf-8";

    });

angular.module("app.ctrl", []).controller("MainController",
    function ($scope, DataService, $window, $location, $localStorage, $rootScope, blockUI) {

        $scope.cardTemplate = 'ICardTemplate.htm';
        $scope.printMode = false;
        $scope.fontStyles = FONTSTYLES;
        $scope.fontTypes = FONTS;

        $rootScope.elementdragSetting = {
            containment: '#cardArea',
            onDrag: function (event, ui) {
                var element = angular.element(event.target);
                dragElement = element.scope().item || element.scope().card.photo;
                if (dragElement && ui.position) {
                    dragElement.y = ui.position.top,
                    dragElement.x = ui.position.left;
                    safeApply($scope);
                }
            }
        };

        $rootScope.tooldragSetting = {
            groupName: 'toolboxCanvas',
            containment: 'body',
            dragMode: "clone",
        };

        $rootScope.droppableSetting = {
            groupName: 'toolboxCanvas',
            acceptType: '.dr-item',
            onDrop: function (element, position) {
                var obj = angular.copy(element);
                if (obj) {
                    var calculatedPosition = calculateCordinates('cardArea', position);
                    obj.x = calculatedPosition.x,
                    obj.y = calculatedPosition.y,

                    // add element in main object 
                    $scope.card.format.push(obj);
                    safeApply($scope);
                }
            }
        };

        $rootScope.resizableSetting = {
            active: true,
            resize: function (event, ui) {
                if (ui) {
                    var element = angular.element(event.target);
                    var obj = element.scope().item || element.scope().card.photo;
                    obj.width = ui.size.width;
                    obj.height = ui.size.height;
                    safeApply($scope);
                }
            }
        }


        $scope.init = function () {
            DataService.loadTemplate(function (res) { $scope.templates = res; });// get all predefine default tempalte style
            DataService.getFieldsList(function (data) {
                $scope.cardFields = data;
                angular.forEach($scope.cardFields, function (s, i) {
                    $scope.cardFields[i].font = $scope.cardFields[i].font || {};
                    $scope.cardFields[i].font.size = 12;
                    $scope.cardFields[i].font.color = '#000000';
                    $scope.cardFields[i].font.type = $scope.fontTypes[0];
                    $scope.cardFields[i].font.style = $scope.fontStyles[0];
                });

            });// get all field list
            // get all data into root variable
            DataService.getIdData(function (res) {
                $rootScope.cardDataSource = res;
            });
        }

        $rootScope.fMaxLenght = 0;
        $scope.$watch("card.format", function (val) {
            $rootScope.fMaxLenght = _.max(_.map(val, function (v) { return v.title.length; })) * 7.8;
        }, true);

        setDefualtSetting();

        $scope.$watch('cardFields', function (val) {
            if (val) {
                val.forEach(function (v) {
                    $scope.card.format.forEach(function (t, index) {
                        if (t.key === v.key) {
                            var tmp = $scope.card.format[index];
                            $scope.card.format[index] = v;
                            if (tmp && $scope.card.format[index]) { // skip few properties
                                $scope.card.format[index].x = tmp.x;
                                $scope.card.format[index].y = tmp.y;
                                $scope.card.format[index].width = tmp.width;
                                $scope.card.format[index].height = tmp.height;
                            }
                        }
                    });

                });
            }
        }, true);



        //selection of template  
        $rootScope.$watch('selectedTemplate',
            function (val) {
                if (val && val.Id && val.Format) {
                    var data = JSON.parse(val.Format);
                    $scope.card = data;
                    $scope.card.templateId = val.Id;
                    var BGImagePath = $('#contentImgPath').val();
                    if ($scope.card.bgImage && !$scope.card.bgImage.url) $scope.card.bgImage = { url: BGImagePath + $scope.card.bgImage + ".jpg" };
                    if ($scope.card.header.img && !$scope.card.header.img.url) $scope.card.header.img = { url: BGImagePath + $scope.card.header.img + ".jpg" };

                    if (data && data.format) // load setting for fields
                    {
                        data.format.forEach(function (f) {
                            var index = _.indexOf($scope.cardFields, _.find($scope.cardFields, { 'key': f.key }));
                            if (f) {
                                $scope.cardFields[index].title = f.title;
                                $scope.cardFields[index].font = {};
                                $scope.cardFields[index].font = f.font;
                            }
                        });
                    }
                } else {
                    setDefualtSetting();
                }
            }, true);



        $rootScope.getXCordinateWithRespectContainer = function (item, continerId) {
            var canvasOffset = $('#' + continerId).offset();
            return item.x + 'px'; ////+ canvasOffset.left
        }


        $rootScope.getYCordinateWithRespectContainer = function (item, continerId) {
            var canvasOffset = $('#' + continerId).offset();
            return item.y + 'px';//+ canvasOffset.top
        }


        // saving of template into db 
        $scope.saveTemplateSetting = function () {
            var card = $scope.card;
            var name = $window.prompt("please enter template name to be saved");
            if (name) {
                var formData = angular.copy(card);
                var imgs = []

                // FOR IMAGE SAVING
                var imgData = (card.header.img && card.header.img.dataURL) ? card.header.img.dataURL : "";
                if (imgData) {
                    formData.header.img = guid();
                    imgs.push({ name: formData.header.img, data: imgData });
                }
                var imgData = (card.bgImage && card.bgImage.dataURL) ? card.bgImage.dataURL : "";
                if (imgData) {
                    formData.bgImage = guid();
                    imgs.push({ name: formData.bgImage, data: imgData });
                }
                // ALL DATA TO PASS SERVER
                DataService.saveTemplate({ 'name': name, 'format': angular.toJson(formData), imgs: imgs }, function () {
                    alert('Template successfully saved.');
                    reloadTemplate();
                });
            }
        };

       

        //orientation 
        $scope.$watch('card.orientation', function (val) {
            if (!$scope.printMode) {
                var config = DataService.getDefaultConfiguraiton(val);
                $scope.card = angular.merge($scope.card, config);
            }
        });


        $scope.newCard = function () {
            $scope.selectedTemplate = null;
            setDefualtSetting();
        };

        $scope.deleteTemplate = function () {
            if ($scope.selectedTemplate && $scope.selectedTemplate.Id >0 && confirm('Are you sure to delete this Template ?')) {
                DataService.deleteTemplate($scope.selectedTemplate.Id);
                reloadTemplate();
                $scope.newCard();
            }
        }

        $scope.backToHome = function () {
            $window.history.back();

        }

        function setDefualtSetting() {
            $scope.card = $scope.card || { photo: {}, header: {}, };
            $scope.card.orientation = 'h';
            $scope.card.format = [];
            $scope.card.header.img = { url: 'Content/css/schoollogo.png' };
            $scope.card.photo.img = 'Content/css/student.png';
        }

        function reloadTemplate() {
            DataService.loadTemplate(function (res) { $scope.templates = res; });// reload templates
        }

 function PrintCalls(index) {
            blockUI.message('processing card ' +(index+1) +'..')
            var id = $scope.finalCardSource[index].stdId;
            var idFilter = '#std_icard_' + id + '  #cardArea';
            var element = $(idFilter);
            // console.log(element);
            html2canvas(element, {
                //  logging:"on",
                allowTaint: true,
                taintTest: true,
                useCORS: true,
                onrendered: function (canvas) {
                    var data = {
                        stdId: id,
                        img: canvas.toDataURL()
                    }
                    DataService.saveImage(data);

                    if (++index < $scope.finalCardSource.length)
                        PrintCalls(index);
                    else
                        blockUI.stop();
                }
            });
        }

        $scope.printCards = function () {
            blockUI.start({  message: 'processing start..' });
            $scope.finalCardSource = _.first($rootScope.cardDataSource, 125);
            $scope.$$postDigest(function () {
                PrintCalls(0);
            });
        }


        $scope.px2cm = function (px) {
            var d = $("<div/>").css({ position: 'absolute', top: '-1000cm', left: '-1000cm', height: '1000cm', width: '1000cm' }).appendTo('body');
            var px_per_cm = d.height() / 1000;
            d.remove();
            return px / px_per_cm;
        }

    });


