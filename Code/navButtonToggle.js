
function buttonToggle(){

    {
        $(document).ready(function () {
            /* function called when you click of the button */
            $("button").click(function () {
                /* this if else to change the text in the button */
                if ($("button").text() === "☰") {
                    $("button").text("X");
                } else {
                    $("button").text("☰");
                }

                /* this function toggle the visibility of our "li" elements */
                $("li").toggle("slow");
            })
        })
    }

}
