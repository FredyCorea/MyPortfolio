
class Footer extends HTMLElement {
     constructor() {
          super();
     }

     connectedCallback() {
          this.innerHTML = `
     <style>

          .reduced-hight-centered {
          line-height: 50%;
          font-size: 12px;
          text-align: center;
          }
  
          .footer:link{
          color:blue;
          font-size: 12px;
          line-height: 50%;
          text-align: right;
          }

          a.footer:hover{
          color: red;
          }

     </style>


     <footer>
 
       <p class="reduced-hight-centered">12365 SW 255th Terrace. Homestead FL, 330326</p>

       <a href="mailto:fredycorea@hotmail.com" class="footer">fredycorea@hotmail.com </a>
       <spacer type="horizontal" width="100" height="100"> ♢ </spacer>

       <a href="mailto:fredycorea@hotmail.com" class="footer">fredycorea@egstek.com</a>
       <spacer type="horizontal" width="100" height="100"> ♢ </spacer>
 
       <a href="tel:3058090938" class="footer">305-809-0938</a>
       <spacer type="horizontal" width="100" height="100"> ♢ </spacer>
       <a href="tel:7864730207" class="footer">786-473-0207</a>

     </footer>


    `;
     }
}

customElements.define('footer-component', Footer);
