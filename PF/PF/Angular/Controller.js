app.controller("usersController", function ($scope, angularService, viewModel) {
    $scope.users = viewModel;
    $scope.delete = function (id) {
        if(id != -1)
            angularService.users_delete($scope.directory, id);
        var currentIndex = _.findIndex($scope.users, { id: id });
        $scope.users.splice(currentIndex, 1);
    }
    $scope.update = function (user, index) {
        if (id == -1) {
            var getData = angularService.users_createRecord(user);
            getData.then(function (users) {
                $scope.users[index] = users.data;
            });
        }
        else {
            var getData = angularService.users_updateRecord(user);
        }
    }
    $scope.add = function () {
        var user = {
            id: -1,
            login: '',
            password: '',
            firstname: '',
            lastname: '',
            role_id: 1,
            name: '',
            department_id:0,
            name:''
        }
        $scope.users.push(user);
    }
    $scope.setRegions = function (tableName) {
        var getData = angularService.getRegions($scope.directory);
        getData.then(function (regions) {

            $scope.regions = regions.data;
        });
    }
});