


angular.module("app").service("DataService", function ($http) {

    var svc = 'IdDesignerPage.aspx/';

    this.getFieldsList = function (res) {
        return $http.post(svc + 'GetIDsFieldList', { data: {} })
               .success(function (data, status, headers, config) {
                   if (res)
                       res(data.d);
               })
             .error(function (data, status, headers, config) {
                 console.log(data, status);
             });
    }

    this.getDefaultConfiguraiton = function (type) {
        var rs = { header: {}, photo: {}, font: {} };
        rs.templateId = 0;
        rs.templateName = "";
        rs.photo.borderRadius = 0;
        switch (type) {
            case 'v':
                rs.width = 200;
                rs.height = 300;
                rs.header.height = 0;
                rs.photo.width = 80;
                rs.photo.height = 80;
                rs.border_radius = 0;
                break;
            case 'h':
                rs.width = 350;
                rs.height = 180;
                rs.header.height = 0;
                rs.photo.width = 100;
                rs.photo.height = 100;
                rs.border_radius = 5;
                break;
        }
        return rs;
    }

    this.deleteTemplate = function (id) {
        $http.post(svc + 'DeleteTemplate', { 'id': id })
                    .success(function (result) {
                        alert("Template successfully deleted.");
                    }).error(function (data, status, headers, config) {
                        console.log(data, status);
                    });
    }

    this.saveTemplate = function (data, res) {
        $http.post(svc + 'SaveIdTemplate', data)
            .success(function (result) {
                if (res)
                    res(result);
            }).error(function (data, status, headers, config) {
                console.log(data, status);
            });
    }

    this.loadTemplate = function (res) {
        $http.post(svc + 'LoadTemplate', {
        }).success(function (result) {
            if (res)
                res(result.d);
        }).error(function (data, status, headers, config) {
            console.log(data, status);
        });
    }

    this.getIdData = function (res) {
        $http.post(svc + 'GetIdData', {
        }).success(function (result) {
            if (res)
                res(result.d);
        }).error(function (data, status, headers, config) {
            console.log(data, status);
        });
    }

    this.saveImage = function (data, res) {
        $http.post(svc + 'SaveStudentIdImage', {
            data: data, cache: false, async: false
        }).success(function (result) {
            if (res)
                res(result);
        }).error(function (data, status, headers, config) {
            console.log(data, status);
        });

    }
});

