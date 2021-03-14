
var el_up = document.getElementById("GFG_UP");


//Work History List
var whList = [
    { "Company": "Costa Cruises*", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Analyst/Programmer" },
    { "Company": "Oracle", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development" },
    { "Company": "Ramstad", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development" },
    { "Company": "Zerbone Catering", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development" },
    { "Company": "Fidelio Cruises", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development" }
]

function populateWHTable(){
    var whColumns = [];
    for (var i =0; i <whList.length;i++){
        for (var k in whList[i]) {
            if (whColumns.indexOf(k) === -1){
                whColumns.push(k);    //push keys to the array
            }
        }
    }

    // Create a table element 
    var whTable = document.createElement("Table");

     // Create table row tr element of a table 
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
       
        for (var j = 0; j < whColumns.length; j++) {
            var cell = tableRow.insertCell(-1);
            // Inserting the cell at particular place 
            cell.innerHTML = whList[i][whColumns[j]];
        }
    }

    // Add the newely created table containing json data 
    var element1 = document.getElementById("whTable");
    element1.innerHTML = "";
    element1.appendChild(whTable);

}
