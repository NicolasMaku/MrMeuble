<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.analytique.exercice.Exercice" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Exercice> exos = ((List<Exercice>) request.getAttribute("exos"));
%>

<html>
<head>
    <title>Exercice</title>
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../assets/css/demo.css" />
</head>
<body>
    <div class="container-xxl">
        <div class="container-p-y d-flex justify-content-center">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex">
                        <i class="bx bx-calendar-event"></i>
                        <h5>Choisir un exerecice</h5>
                    </div>
                </div>



                <div class="card-body">
                    <form action="/exercice/set" method="post">
                        <div class="d-flex px-2 gap-2">
                            <select class="form-select" name="id">
                                <%
                                    for(Exercice exo: exos) {
                                %>
                                    <option value="<%=exo.getId()%>"> <%=exo.getAnnee()%> (Debut: <%=exo.getDateDebut()%>)</option>
                                <%
                                    }
                                %>
                            </select>

                            <button class="btn btn-secondary text-nowrap" type="button">Nouvelle Exercice</button>

                        </div>

                        <div class="d-flex justify-content-center mt-3">
                            <button type="Submit" class="btn btn-primary">Choisir</button>
                        </div>

                    </form>
                </div>
            </div>


        </div>
    </div>
</body>
</html>
