class Header extends HTMLElement{
    constructor(){
        super();
    }

    connectedCallback(){
        this.innerHTML = `
      
            <div class="header">
                <p class="logo1">Fredy R. Corea</p>
                <p class="logo2">Software Designer and Developer</p>
                <p class="logo3">Professional Porfolio</p>
            </div> 
        `;
    }
}
customElements.define('header-component', Header);