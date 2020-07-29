

angular.module("app.directive", []).
    directive("field", function ($parse) {
        return {
            restrict: 'E',
            scope: {
                label: '@',
                placeholder: '@',
                type: '@',
                options: '=',
                bind: '='
            },
            replace: true,
            template: function (element, attr) {
                var lable = '<div class="form-group"> <label class="control-label col-sm-{{widthRatio[0]}}" >{{label}}:</label> ';
                switch (attr.type) {
                    case 'select':
                        return lable + '<span class="col-sm-{{widthRatio[1]}}">  <select class="form-control chzn-select {{options.class}}"  ng-model="bind" ng-options="option[options.nameField] for option in options.data track by option[options.valueField]" > <option value="">--select--</option></ select> </span></div>';
                    case 'uploader':
                        return lable + '<span class="col-sm-{{widthRatio[1]}}">  <input type="file" accept="image/*" image="bind" /></span></div>';
                    case 'checkbox':
                        return lable +
                         '<span class="col-sm-{{widthRatio[1]}}"><input  type="checkbox" ng-model="bind" ></span><div>';
                        break;
                    case 'radio':
                        return lable +
                        '<span class="col-sm-{{widthRatio[1]}}"><label class="radio-inline" ng-repeat="op in options">' +
                        '<input  type="radio" name="{{op.name}}" value="{{op.value}}" ng-model="$parent.bind">{{op.label}}</label></span><div>';
                        break;

                    default:
                        return lable + '<div class="col-sm-{{widthRatio[1]}}">' +
                               '<input type="{{type}}" ng-trim="false" ng-model="bind" class="form-control"  placeholder="{{placeholder}}">  </div> </div>';
                }



            },
            link: function (scope, elem, attrs) {
                if (attrs.id)
                    elem.attr('id', attrs.id);

                scope.widthRatio = (attrs.widthRatio) ? attrs.widthRatio.split(':') :
                    (angular.element(elem.parent()).attr('width-ratio') ?
                    angular.element(elem.parent()).attr('width-ratio').split(':') : [2, 10]);

                var settings = $parse(attrs.settings)();
                if (settings)
                    angular.forEach(settings, function (v, t) {
                        elem.find('input').attr(t, settings[t]);
                    });

            }
        };
    });


angular.module("app.directive").
    directive("icard", function ($timeout) {
        return {
            restrict: 'E',
            scope: {
                card: '=',
                data: '=',
                printMode: '=',
                afterRender: '='
            },
            templateUrl: "Content/template/cardArea.html",
            link: function (scope, element, attrs) {
                if (scope.afterRender)
                    $timeout(scope.afterRender(), 0);
            }
        }
    });



angular.module("app.directive").
    directive("draggable", function ($parse) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var setting = scope.$eval(attrs.draggable), // get all setting 
                    revertDuration = setting.revertDuration || 300, // get revert if in wrong place 
                    zIndex = setting.zIndex || 100000, // z indexing of dragging  element 
                    isInActive = scope.$eval(attrs.isActive)==false

                /* apply dragging plugin */
                $(element).draggable({
                    disabled: isInActive,
                    appendTo: setting.containment || 'body',// To drag over scrollbar
                    scroll: false, // stop container scrolling while moving element 
                    refreshPositions: true,//update cordinates on dragged element 
                    /*setting for zindex apply to dont overlap anything on this element*/
                    zIndex: zIndex,
                    /*setting for revert of elmenet position in case of invalid scope dropping*/
                    revertDuration: revertDuration,

                    /* setting callbacks*/
                    drag: function (a, b, c) {
                        if (setting.onDrag && typeof (setting.onDrag) == 'function') setting.onDrag(a, b, c); // call callback function on drag
                    },
                    start: function (a, b, c) {
                        if (setting.onDragStart && typeof (setting.onDragStart) == 'function') setting.onDragStart(a, b, c); // call when drag start
                    },
                    stop: function (a, b, c) {
                        if (setting.onDragStop && typeof (setting.onDragStop) == 'function') setting.onDragStop(a, b, c);// drag stop
                    },
                });

                /**settings**/



                /* used to grouping of draggable and droppable*/
                if (setting.groupName) {
                    $(element).draggable("option", "scope", setting.groupName);
                    //if group name supplied for droppable it will validate for rever if invalid drop 
                    $(element).draggable("option", "revert", 'invalid');
                }
                /*set drag take snapshot of element as clone or original*/
                if (setting.dragMode)
                    $(element).draggable("option", "helper", setting.dragMode);
                /* set parent inside of that it can be draggable  */
                if (setting.containment && $(setting.containment))
                    $(element).draggable("option", "containment", $(setting.containment));

                /* pass info to droppable*/
                // for passsign inforamtion between element and drag directive
                var draggableData = scope.$eval(attrs.draggableData);
                if (draggableData)
                    $(element).data('data', draggableData);

            }

        };
    });

angular.module("app.directive").
    directive("droppable", function () {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                /*fetch settings from attribute of applicable element*/
                var setting = scope.$eval(attrs.droppable);

                /*apply droppable plugin to element */
                $(element).droppable({
                    scope: setting.groupName,
                    accept: setting.acceptType,
                    addClasses: false,
                    drop: function (event, ui) {
                        var dragEl = $(ui.draggable),
                        dropEl = $(this);

                        /*dragEl.data('data') is meta data source supplied from draggable
                        component need to pass while dropping */

                        if (setting.onDrop)
                            setting.onDrop(dragEl.data('data'), {
                                x: event.pageX,
                                y: event.pageY,
                                event:event,
                                ui: ui
                            });
                        //console.log( event);
                    }
                });
            }
        };
    });



angular.module("app.directive").
    directive("resizable", function ($interpolate) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var setting = scope.$eval(attrs.resizable),// get all setting
                    addHandler = setting.addHandler || true; // add handler setting

                /*handling points for user to scaling /resizing element*/
                var handlerTemplate = '  <div class="ui-resizable-handle overlay-control cursor-nw-resize " style="top: 0%; left: 0%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-n-resize" style="top: 0%; left: 50%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-ne-resize" style="top: 0%; left: 100%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-w-resize" style="top: 50%; left: 0%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-e-resize" style="top: 50%; left: 100%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-sw-resize" style="top: 100%; left: 0%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-s-resize" style="top: 100%; left: 50%;"></div>' +
                            '<div class="ui-resizable-handle overlay-control cursor-se-resize" style="top: 100%; left: 100%;"></div>';

                if (addHandler)
                    $(element).append(handlerTemplate);


                /*fire action to resizable active or
                not and element is selected or not  */
                scope.$watch(function () {
                    var selected = scope.$eval(attrs.isActive);
                    var rz = scope.$eval(attrs.resizable);
                    return (rz.active == true && selected == true);
                }, function (newValue) {
                    $(element).resizable(newValue ? 'enable' : 'disable');
                });



                $(element).resizable({
                    maxHeight: 700,
                    minHeight: 5,
                    minWidth: 10,
                    handles: {
                        'nw': '.cursor-nw-resize',
                        'ne': '.cursor-ne-resize',
                        'sw': '.cursor-sw-resize',
                        'se': '.cursor-se-resize',
                        'n': '.cursor-n-resize',
                        'e': '.cursor-e-resize',
                        's': '.cursor-s-resize',
                        'w': '.cursor-w-resize'
                    },
                    resize: function (event, ui) {
                        setting.resize(event, ui);
                    },
                    start: function (event, ui) {
                        // showInfoPanel(ui);
                    },
                    stop: function (event, ui) {
                        // hideInfoPanel();


                    }
                });




            }
        };
    });

function safeApply(scope) {
    //  console.log('--apply scope --');
    if (!scope.$$phase) {
        //  console.log('--apply scope applying --');
        scope.$apply();
    }
}


/*calculate cordinate of element */
function calculateCordinates(continerId, position) {
    var canvasOffset = $('#' + continerId).offset();
    position.x = position.ui.offset.left - canvasOffset.left //- centerX;
    position.y = position.ui.offset.top - canvasOffset.top //- centerY;
    return position;
}


function guid() {
    function _p8(s) {
        var p = (Math.random().toString(16) + "000000000").substr(2, 8);
        return s ? "-" + p.substr(0, 4) + "-" + p.substr(4, 4) : p;
    }
    return _p8() + _p8(true) + _p8(true) + _p8();
}