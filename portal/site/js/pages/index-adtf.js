index = function(){
    
	var _init = function (){
		//valida se o usuário esta logado
		$(".liLogged").hide();
		$("#btnExportarPDF").hide();
        
		if($.sessionStorage.getItem('userType') == "admin" || $.sessionStorage.getItem('userType') == "adtf"){
			util.setNameUser();
			$(".lnkLogin").hide();
			$(".liLogged").show();
		}
	}
    
    var currentQueryResult;
    
    var _getQueryResult = function (parameterType, parameterId) {
        $.ajax({
            type: 'GET',
            async: false,
            url: '/api/adtf/' + parameterType + '/' + parameterId,
            success: function(jdata){
                
                var jsonData = eval(jdata);
                
                currentQueryResult = jsonData;
                
                // Create table
                var table = _makeTable(currentQueryResult.dados);
                $("#tabela-de-resultados-titulo").html("<h4>" + currentQueryResult.titulo + "</h4>");
                $("#tabela-de-resultados-subtitulo").html("<blockquote>" + currentQueryResult.subtitulo + "</blockquote>");
                $("#tabela-de-resultados-descricao").html("<blockquote>" + currentQueryResult.descricao + "</blockquote>");
                $("#tabela-de-resultados").html(table);
                
                // Create chart
                _drawChart(currentQueryResult.dados);
                
                // Collapse accordion
                $(".collapsible-body").each(function() {
                    $( this ).hide(400);
                });
                $(".active").each(function() {
                    $( this ).removeClass( "active" );
                });
                
                $("#btnExportarPDF").show();
            }
        });
    }
    
    var _makeTable = function (jsonData) {
        var table = $('<table border=1>');
        var tblHeader = "<tr>";
        for (var k in jsonData[0]) tblHeader += "<th>" + k + "</th>";
        tblHeader += "</tr>";
        $(tblHeader).appendTo(table);
        $.each(jsonData, function (index, value) {
            var TableRow = "<tr>";
            $.each(value, function (key, val) {
                TableRow += "<td>" + val + "</td>";
            });
            TableRow += "</tr>";
            $(table).append(TableRow);
        });
        return ($(table));
    };
    
    var _drawChart = function (jsonData) {
        
        //NOTA - Como a tabela é dinamica, o eixo x é o primeiro campo e o eixo y é o ultimo campo da tabela/json

        var googleDataTable = new google.visualization.DataTable();
        
        // Get columns
        jsonDataItems = jsonData[0];
        
        counter = 0
        Object.keys(jsonData[0]).forEach(function(key) {
            var columnType = isNaN(jsonData[0][key]) ? 'string' : 'number';
            if(counter == 0)
                googleDataTable.addColumn('string', key);
                
            else if(counter > 0 && columnType == 'number')
                googleDataTable.addColumn(columnType, key);
                
            counter++;
        });
        
        // Get values
        for (i = 0; i < jsonData.length; i++)
        {
            jsonDataItem = jsonData[i];
            
            var currentRow = [];
            
            for(var key in jsonDataItem)
            {
                for (j = 0; j < googleDataTable.getNumberOfColumns(); j++)
                {
                    if(key == googleDataTable.getColumnLabel(j))
                    {
                        if(j == 0)
                            currentRow.push(String(jsonDataItem[key]));
                            
                        else
                            currentRow.push(Number(jsonDataItem[key]));
                    }
                }
            }
            
            googleDataTable.addRow(currentRow);
        }

        // Set options
        var options = {
            'legend': 'right',
            'is3D'  : true,
            'height': 300,
            seriesType: "bars",
            series: {4: {type: "line"}}
        };
        
        // Generate chart
        var chart = new google.visualization.ComboChart(document.getElementById('grafico'));
        chart.draw(googleDataTable, options);
    }
    
    var _pdfExport = function () {
        
        // Variables
        var title = currentQueryResult.titulo;
        var subtitle = currentQueryResult.subtitulo;
        //var description = currentQueryResult.descricao;
        var description = "";
        var jsonData = currentQueryResult.dados;
        var charDiv = $('#grafico');
        
        // Create PDF
        createPDF();
        
        // Main PDF event
        function createPDF() {
            
            getCanvas().then(function(canvas){
                
                try
                {
                    var k = 72/25.4 // Scale factor mm to pt
                    
                    var pageWidth = 210 * k;
                    var pageHeight = 297 * k;
                    var pageMargin = 10 * k;
                    var imageResizeFactor = canvas.width / (pageWidth - (pageMargin * 2));
                    
                    var imageWidth = canvas.width / imageResizeFactor;
                    var imageHeight = canvas.height / imageResizeFactor;
                    var imageCompress = 'none';
                    
                    var img = canvas.toDataURL("image/png");
                    //console.log(img);
                    
                    var doc = new jsPDF('p', 'pt', 'a4', true);
                            
                    //doc.setDrawColor(0);
                    //doc.setFillColor(238, 238, 238);
                    //doc.rect(0, 0, pageWidth,  pageHeight, 'F');
                            
                    var verticalShift = pageMargin;
                    
                    // Title
                    verticalShift = verticalShift + (20 * k);
                    doc.setFontSize(30);    
                    doc.text(pageMargin, verticalShift, title);
                    
                    // Subtitle
                    verticalShift = verticalShift + (8 * k);
                    doc.setFontSize(12);
                    doc.text(pageMargin, verticalShift, subtitle);
                    
                    // Description
                    verticalShift = verticalShift + (6 * k);
                    doc.setFontSize(10);
                    doc.text(pageMargin, verticalShift, description);
                    
                    // Chart
                    verticalShift = verticalShift + (6 * k);
                    doc.addImage(img, 'png', pageMargin, verticalShift, imageWidth, imageHeight, undefined, imageCompress);
                    
                    // Table
                    verticalShift = verticalShift + imageHeight;
                    //doc.setFont("times", "normal");
                    doc.setFontSize(10);
                    height = doc.drawTable(jsonData, {
                        xstart : pageMargin,
                        ystart : pageMargin,
                        tablestart : verticalShift,
                        marginright : pageMargin,
                        xOffset : 10,
                        yOffset : 20
                    });
                    
                    // Output
                    //doc.output("dataurlnewwindow");
                    doc.save('Relatorio AdTF.pdf');
                }
                catch(err)
                {
                    console.log(err);
                }
            });
        }

        // create canvas object
        function getCanvas(){
            return html2canvas(charDiv,{
                //imageTimeout:2000,
                //removeContainer:true
            });	
        }
    }

	return {
		init:_init,
        getQueryResult:_getQueryResult,
        pdfExport:_pdfExport
	}
    
}();