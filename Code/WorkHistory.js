
var el_up = document.getElementById("GFG_UP");

function populateWHTable( whList ) {

    var whColumns = [];
    for (var i = 0; i < whList.length; i++) {
        for (var k in whList[i]) {
            if (whColumns.indexOf(k) === -1) {
                whColumns.push(k);    //push keys to the array
            }
        }
    }

    // Create a table element 
    var whTable = document.createElement("Table");

    //Create table row tr element of a table 
    //var whTableRow = table.insertRow(-1);
    var whTableRow = whTable.insertRow(-1);
    for (var i = 0; i < whColumns.length; i++) {

        // Create the table header th element 
        var whTableHeader = document.createElement("th");
        whTableHeader.innerHTML = whColumns[i];

        // Append columnName to the table row 
        whTableRow.appendChild(whTableHeader);
    }

   // Adding the data to the table 
    for (var i = 0; i < whList.length; i++) {
        // Create a new row 
        tableRow = whTable.insertRow(-1);

        for (var j = 0; j < whColumns.length; j++) 
        {
            var cell = tableRow.insertCell(-1);
            // Inserting the cell at particular place 
            if (whColumns[j] != "Company"){
                cell.innerHTML = whList[i][whColumns[j]];
            } else{
                //var linkPath = "<a href=" + "https://www.w3schools.com"+ ">"
                var linkPath = "<a href= " + "'" + whList[i].PagePath + "'>";
                //linkPath = linkPath + "yourpage</td>";
                linkPath = linkPath + whList[i].Company +  "</td>";
                cell.innerHTML = linkPath;
                temp   = cell.innerHTML ;  //for stop only, toeval cell.innerHTML, remove it!
            }
        }

        //<td onclick="location.href='yourpage.html'">go to yourpage</td>
        //<a href="https://www.w3schools.com">Visit W3Schools.com!</a>
    }

    // Add the newely created table containing json data 
    var element1 = document.getElementById("whTable");
    element1.innerHTML = "";
    element1.appendChild(whTable);

}
