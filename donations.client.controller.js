(function () {
  'use strict';

  // Donations controller
  angular
    .module('donations')
    .controller('DonationsController', DonationsController);

  DonationsController.$inject = ['DonationsService'];

  function DonationsController (DonationsService) {
     var vm = this;

    vm.donations = DonationsService.query();
    console.log(vm);
    vm.myData = vm.donations;

    vm.gridOptions = {
    showGridFooter: true,
    showColumnFooter: true,
    enableFiltering: true,
    data: 'vm.myData',
    columnDefs: [{ field: 'user.displayName', displayName: 'Contributor'},
                  { field: 'amount', displayName: 'Amount Donated'},
                  { field: 'created', cellFilter: 'date:\'MMM dd yyyy\''},
                  {field: 'projectId', displayName:'Project Link',
                  cellTemplate:'<div ng-show="{{COL_FIELD}}" class="ui-grid-cell-contents tooltip-uigrid" title="{{COL_FIELD.name}}">' +
                       '<i><a class="btn btn-link" style="color:#74bbbd;" href="projects/{{COL_FIELD CUSTOM_FILTERS._id}}">{{COL_FIELD CUSTOM_FILTERS.name}}</a></i></div>'}
                  ]};
                                      

  }
}());
