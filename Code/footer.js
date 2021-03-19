class Footer extends HTMLElement {
     constructor() {
          super();
     }

     connectedCallback() {
          this.innerHTML = `
     <footer class="footer" style="text-align:center" >
    
       <p class="reduced-hight-centered">12365 SW 255th Terrace. Homestead FL, 330326</p>

       <a href="mailto:fredycorea@hotmail.com">fredycorea@hotmail.com </a>
       <spacer type="horizontal" width="100" height="100"> || </spacer>

       <a href="mailto:fredycorea@hotmail.com">fredycorea@egstek.com</a>
       <spacer type="horizontal" width="100" height="100"> || </spacer>
 
       <a href="tel:3058090938">305-809-0938</a>
       <spacer type="horizontal" width="100" height="100"> || </spacer>
       <a href="tel:7864730207">786-473-0207</a>

     </footer> `;
     }
}

customElements.define('footer-component', Footer);
