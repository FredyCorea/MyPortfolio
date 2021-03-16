function GetWorkHistoryData() {

    // var wh = [
    //     { "Company": "Global Benefits Group, Inc", "From": "03/02/2020", "Until": "01/15/2021", "Title": "Analyst/Programmer", "PagePath": "whGbg.html" },
    //     { "Company": "Oracle", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development", "PagePath": "whOracle.html" },
    //     { "Company": "Ramstad", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development", "PagePath": "whRamstad.html" },
    //     { "Company": "Zerbone Catering", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development", "PagePath": "whZerbone.html" },
    //     { "Company": "Fidelio Cruises", "From": "01/01/2020", "Until": "01/01/2021", "Title": "Lead of Development", "PagePath": "whFidelio.html" }
    // ]

    //<img src="Images/gbg2.png" alt="logo" style="width:100%">

    var wh = [{
            "PagePath": "whGbg.html",
            "ImagePath": "Images/gbg2.png",
            "Company": "Global Benefits Group, Inc",
            "From": "03/02/2020",
            "Until": "01/15/2021",
            "Title": "Analyst/Programmer"
        },
        {
            "PagePath": "whOracle.html",
            "ImagePath": "Images/oracle.png",
            "Company": "Oracle",
            "From": "01/01/2020",
            "Until": "01/01/2021",
            "Title": "Lead of Development"
        },
        {
            "PagePath": "whRamstad.html",
            "ImagePath": "Images/ranstad.png",
            "Company": "Ranstad",
            "From": "01/01/2020",
            "Until": "01/01/2021",
            "Title": "Lead of Development"
        },

        {
            "PagePath": "whFidelio.html",
            "ImagePath": "Images/Fidelio.png",
            "Company": "Fidelio Cruises",
            "From": "01/01/2020",
            "Until": "01/01/2021",
            "Title": "Lead of Development"
        },
        {
            "PagePath": "whCosta.html",
            "Company": "Costa Cruises, NV",
            "ImagePath": "Images/CostaCruises.png",
            "From": "01/01/2020",
            "Until": "01/01/2021",
            "Title": "Lead of Development"
        },

        {
            "PagePath": "whZerbone.html",
            "Company": "Zerbone Catering",
            "ImagePath": "Images/Zerbone.jpg",
            "From": "01/01/2020",
            "Until": "01/01/2021",
            "Title": "Lead of Development"
        },

    ]

    return wh;
}

//<td style="cursor:pointer" onclick="location.href='mylink.html'">link</td>

function GetPeopleData() {
    var people = [
        { "id": "1", "firstName": "John", "lastName": "Doe" },
        { "id": "2", "firstName": "Mary", "lastName": "Peterson" },
        { "id": "3", "firstName": "George", "lastName": "Hansen" }
    ]

    return people;
}