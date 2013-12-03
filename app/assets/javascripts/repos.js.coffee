jQuery ->
  $("#repos").dataTable
    bProcessing: true
    bServerSide: true
    aaSorting: [[1, "desc"]]
    sPaginationType: "bootstrap"
    sAjaxSource: $("#repos").data("source")
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
    aoColumnDefs: [
      aTargets: [0]
      fnCreatedCell: (nTd, sData, oData, iRow, iCol) ->
        $(".results-tooltip", nTd).tooltip()
    ]
