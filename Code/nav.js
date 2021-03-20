
class NavMenu extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `

    <ul class="navMenu">
        <!-- Button to toggle menu -->
        <button>X</button>
        <li><a href="Index.html" class="main-menu">Home </a> </li>
        <li><a href="Technologies.html" class="main-menu">Technologies </a> </li>
        <li><a href="WorkHistory.html" class="main-menu">Work History </a> </li>
        <li><a href="inConstruction.html" class="main-menu">Portfolio </a> </li>
        <li><a href="Education.html" class="main-menu">Education </a></li>
    
    </ul>`;
    }

}
customElements.define('nav-component',NavMenu);


