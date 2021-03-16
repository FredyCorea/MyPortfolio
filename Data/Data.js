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
            "Title": "Applications Support Engineer "
        },
        {
            "PagePath": "whOracle.html",
            "ImagePath": "Images/oracle.png",
            "Company": "Oracle",
            "From": "05/02/2016",
            "Until": "02/13/2019",
            "Title": "Software Developer Level 5 and Functional Architect "
        },
        {
            "PagePath": "whRamstad.html",
            "ImagePath": "Images/ranstad.png",
            "Company": "Ranstad",
            "From": "06/26/2015",
            "Until": "05/01/2016",
            "Title": "Lead of Development"
        },

        {
            "PagePath": "whFidelio.html",
            "ImagePath": "Images/Fidelio.png",
            "Company": "Fidelio Cruises",
            "From": "04/01/2096",
            "Until": "06/25/2015",
            "Title": "Lead of Development and Developer"
        },
        {
            "PagePath": "whCosta.html",
            "Company": "Costa Cruises, NV",
            "ImagePath": "Images/Costa.png",
            "From": "01/09/1999",
            "Until": "11/01/2005",
            "Title": "Analyst/Programmer"
        },

        {
            "PagePath": "whZerbone.html",
            "Company": "Zerbone Catering",
            "ImagePath": "Images/Zerbone.jpg",
            "From": "01/01/1994",
            "Until": "01/01/1999",
            "Title": "Analyst/Programmer"
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