    <%--

        The contents of this file are subject to the license and copyright
        detailed in the LICENSE and NOTICE files at the root of the source
        tree and available online at

        http://www.dspace.org/license/

    --%>
        <%--
          - Footer for home page
          --%>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

        <%@ page contentType="text/html;charset=UTF-8" %>

        <%@ page import="org.dspace.app.webui.util.UIUtil" %>

            <%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

        <%-- Right-hand side bar if appropriate --%>
            <%
    if (sidebar != null)
    {
%>
        </div>
        <div class="col-md-3">
            <%= sidebar %>
        </div>
        </div>
            <%
    }
%>
        </div>
        </main>
        <%-- Page footer --%>
            <footer class="footer" id="ds-footer">
            <div class="container text-muted">

                <div class="text-center col-md-12">
                         <div class="pull-left" style="padding-top: 15px;padding-bottom: 10px;">
                            <a href="/jspui/feedback"><img src="<%= request.getContextPath() %>/image/LogoRepositorioRodape_1.gif"></a>
                         <div class="pull-right" style="padding-left:30px;">
                            <div class="footer-institution-data">Universidade Federal dos Vales do Jequitinhonha e Mucuri</div>
                            <div class="footer-institution-data">Biblioteca Central do campus JK </div>
                            <div class="footer-institution-data">repositorio@ufvjm.edu.br</div>
                            <div class="footer-institution-data">(38) 3532-1208</div>
                        </div>
                </div>
                         <div class="pull-right" style="padding-top:15px;padding-topo: 10px;">
                            <div class="pull-right" style="padding-left:30px;">
                                 <div class="footer-institution-data">Construído com  <a href="http://www.dspace.org/" target="_blank">software DSpace</a>, version 5.7.</div>
                            </div>
                         </div>

                 </div>

            </div>
            </footer>
        <script>
        jQuery.noConflict();
        jQuery(document).ready(function () {

        jQuery('#community-tree').jstree({
        "core": {
        "themes": {
        responsive: true,
        variant: "large",
        icons: false
        }
        },

        "types": {
        "max_depth": -2,
        "max_children": -2

        },

        "core" : {
        "check_callback" : false
        },

        "plugins": ["wholerow","dnd"]

        }).on("select_node.jstree", function (e, data) {
        document.location = data.instance.get_node(data.node, true).children('a').attr('href');
        });

        });
        </script>
        </body>
        </html>
