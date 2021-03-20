class Head extends HTMLElement{
    constructor(){
        super();
    }

    connectedCallback(){
        this.innerHTML = `
      
        <title>Web Portfolio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" href="Code/stylesheet.css" media="screen" rel="styleSheet" />
        <link type="text/css" href="Code/header.css" rel="styleSheet" media="screen" />
        <script src="Code/WorkHistory.js"></script>
        <script src="Code/header.js"></script>
        <script src="Code/footer.js" type="text/javascript" defer></script>
        <script src="Data/Data.js"></script>
        <script src="Code/jquery-3.4.1.min.js"></script>
        <script src="Code/nav.js" type="text/javascript" defer></script>
        <script src="Code/navButtonToggle.js"></script>
        `;
    }
}
customElements.define('head-component', Head);