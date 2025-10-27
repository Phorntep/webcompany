<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test.aspx.vb" Inherits="Billing_SNC.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <h2>Modal Example</h2>
            <asp:ScriptManager runat="server" />
            <!-- Trigger/Open The Modal -->
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" ID="myBtn" Text="open" OnClick="myBtn_Click" autopostback="false" ClientIDMode="Static" />
                </ContentTemplate>
            </asp:UpdatePanel>



            <!-- The Modal -->
            <div id="myModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p>Some text the Modal..</p>
                </div>

            </div>

            <script>
                // Get the modal
                var modal = document.getElementById("myModal");

                // Get the button that opens the modal
                var btn = document.getElementById("myBtn");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                function OpenModel() {
                    var modal1 = document.getElementById("myModal");
                    modal1.style.display = "block";
                }




                // When the user clicks on <span> (x), close the modal
                span.onclick = function () {
                    modal.style.display = "none";
                }

                        // When the user clicks anywhere outside of the modal, close it
                        //window.onclick = function (event) {
                        //    if (event.target == modal) {
                        //        modal.style.display = "none";
                        //    }
                        //}
            </script>
            
            <video  autoplay="autoplay" loop="loop" muted="muted" >
                <source src="Image/y2meta.com - คาวบอยหลอกดย็_เด็ก5555.mp4" type="video/mp4" />
            </video>
          

    </form>



</body>
</html>
