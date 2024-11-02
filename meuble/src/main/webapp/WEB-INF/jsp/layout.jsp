<%@ page import="java.util.List" %>
<%@ page import="com.source.meuble.utilisateur.Utilisateur" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String msg = ((String) request.getAttribute("msg"));
    String alert = ((String) request.getAttribute("alert"));

//  List<Utilisateur> users = ((List<Utilisateur>) request.getAttribute("users"));
//  DataTable<Utilisateur> table = new DataTable<>();
//  table.setData(users);
//  table.setTitre("Liste des Utilisateurs");
//  table.addColumn("#", "id");
//  table.addColumn("Nom", "username");
//  table.addColumn("Role", "role");
//  table.addAction("Valider", "/valider");
%>

<%
    String pg = (String) (request.getAttribute("page") != null ? request.getAttribute("page") + ".jsp" : "");
    Utilisateur u = (Utilisateur) request.getAttribute("u");
    if (u == null) {
        u = ((Utilisateur) request.getSession().getAttribute("u"));
        if (u == null) {
            response.sendRedirect("/");
            return;
        }
    }
    if (msg != null) {


%>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        alert("<%=msg%>")
    })
</script>
<%
    }
%>

<%
    if (alert != null) {
%>
<script>alert("<%=alert%>")</script>
<%
    }
%>

<%--<!doctype html>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mr Meuble</title>
    <link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <link rel="stylesheet" href="../assets/vendor/libs/apex-charts/apex-charts.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../assets/js/config.js"></script>

</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <jsp:include page="components/sidebar.jsp"/>

        <div class="layout-page">
            <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Search -->
<%--                    <div class="navbar-nav align-items-center">--%>
<%--                        <div class="nav-item d-flex align-items-center">--%>
<%--                            <i class="bx bx-search fs-4 lh-0"></i>--%>
<%--                            <input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search...">--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <!-- /Search -->

                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Place this tag where you want the button to render. -->
                        <li class="nav-item lh-1 me-3">
                            <%=u.getRole().name()%>
                        </li>

                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="../assets/img/avatars/1.png" alt="" class="w-px-40 h-auto rounded-circle">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="../assets/img/avatars/1.png" alt="" class="w-px-40 h-auto rounded-circle">
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-semibold d-block"><%=u.getUsername()%></span>
                                                <small class="text-muted"><%=u.getRole().name()%></small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>


                                <li>
                                    <a class="dropdown-item" href="/logout">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Se Deconnecter</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>
            <div class="flex-grow-1 container-p-y container-fluid">
                <jsp:include page="<%=pg%>"/>
                <%--        <%=table.getHtml()%>--%>
            </div>
            <%--        <nav--%>
            <%--                class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"--%>
            <%--                id="layout-navbar"--%>
            <%--        >--%>
            <%--          <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">--%>
            <%--            <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">--%>
            <%--              <i class="bx bx-menu bx-sm"></i>--%>
            <%--            </a>--%>
            <%--          </div>--%>

            <%--          <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">--%>
            <%--            <!-- Search -->--%>
            <%--            <div class="navbar-nav align-items-center">--%>
            <%--              <div class="nav-item d-flex align-items-center">--%>
            <%--                <i class="bx bx-search fs-4 lh-0"></i>--%>
            <%--                <input--%>
            <%--                        type="text"--%>
            <%--                        class="form-control border-0 shadow-none"--%>
            <%--                        placeholder="Search..."--%>
            <%--                        aria-label="Search..."--%>
            <%--                />--%>
            <%--              </div>--%>
            <%--            </div>--%>
            <%--            <!-- /Search -->--%>

            <%--            <ul class="navbar-nav flex-row align-items-center ms-auto">--%>
            <%--              <!-- Place this tag where you want the button to render. -->--%>
            <%--              <li class="nav-item lh-1 me-3">--%>
            <%--                <a--%>
            <%--                        class="github-button"--%>
            <%--                        href="https://github.com/themeselection/sneat-html-admin-template-free"--%>
            <%--                        data-icon="octicon-star"--%>
            <%--                        data-size="large"--%>
            <%--                        data-show-count="true"--%>
            <%--                        aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"--%>
            <%--                >Star</a--%>
            <%--                >--%>
            <%--              </li>--%>

            <%--              <!-- User -->--%>
            <%--              <li class="nav-item navbar-dropdown dropdown-user dropdown">--%>
            <%--                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">--%>
            <%--                  <div class="avatar avatar-online">--%>
            <%--                    <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />--%>
            <%--                  </div>--%>
            <%--                </a>--%>
            <%--                <ul class="dropdown-menu dropdown-menu-end">--%>
            <%--                  <li>--%>
            <%--                    <a class="dropdown-item" href="#">--%>
            <%--                      <div class="d-flex">--%>
            <%--                        <div class="flex-shrink-0 me-3">--%>
            <%--                          <div class="avatar avatar-online">--%>
            <%--                            <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />--%>
            <%--                          </div>--%>
            <%--                        </div>--%>
            <%--                        <div class="flex-grow-1">--%>
            <%--                          <span class="fw-semibold d-block">John Doe</span>--%>
            <%--                          <small class="text-muted">Admin</small>--%>
            <%--                        </div>--%>
            <%--                      </div>--%>
            <%--                    </a>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <div class="dropdown-divider"></div>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <a class="dropdown-item" href="#">--%>
            <%--                      <i class="bx bx-user me-2"></i>--%>
            <%--                      <span class="align-middle">My Profile</span>--%>
            <%--                    </a>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <a class="dropdown-item" href="#">--%>
            <%--                      <i class="bx bx-cog me-2"></i>--%>
            <%--                      <span class="align-middle">Settings</span>--%>
            <%--                    </a>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <a class="dropdown-item" href="#">--%>
            <%--                        <span class="d-flex align-items-center align-middle">--%>
            <%--                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>--%>
            <%--                          <span class="flex-grow-1 align-middle">Billing</span>--%>
            <%--                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>--%>
            <%--                        </span>--%>
            <%--                    </a>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <div class="dropdown-divider"></div>--%>
            <%--                  </li>--%>
            <%--                  <li>--%>
            <%--                    <a class="dropdown-item" href="auth-login-basic.html">--%>
            <%--                      <i class="bx bx-power-off me-2"></i>--%>
            <%--                      <span class="align-middle">Log Out</span>--%>
            <%--                    </a>--%>
            <%--                  </li>--%>
            <%--                </ul>--%>
            <%--              </li>--%>
            <%--              <!--/ User -->--%>
            <%--            </ul>--%>
            <%--          </div>--%>
            <%--        </nav>--%>

        </div>
    </div>
</div>

<script src="../assets/vendor/libs/jquery/jquery.js"></script>
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assets/js/dashboards-analytics.js"></script>
</body>
</html>

<!DOCTYPE html>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <title>E-Bossy</title>--%>
<%--  <link rel="icon" href="/assets/icon/logo.png">--%>
<%--  <link rel="stylesheet" href="../assets/css/bootstrap.css">--%>
<%--  <link rel="stylesheet" href="../assets/css/bootstrap-reboot.css">--%>
<%--  <link rel="stylesheet" href="../assets/css/bootstrap-grid.css">--%>
<%--  <link rel="stylesheet" href="../assets/css/style.css">--%>
<%--&lt;%&ndash;  <script src="/assets/js/angular.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;  <script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    const app = angular.module("app", [])&ndash;%&gt;--%>
<%--&lt;%&ndash;  </script>&ndash;%&gt;--%>
<%--</head>--%>
<%--<body>--%>
<%--<main>--%>
<%--  <div class="py-2 border-bottom">--%>
<%--    <div class="d-flex flex-wrap justify-content-around">--%>
<%--      <div class="align-content-center align-items-end">--%>
<%--        <b class="">Departement Achat</b>--%>
<%--      </div>--%>
<%--      <div class="">--%>
<%--        <!--                        <img src="../assets/icon/logo.png" alt="" width="34px" class="mx-2">-->--%>
<%--        <b class="_blue" style="font-size: 24px">Mr Meuble</b>--%>
<%--      </div>--%>
<%--      <div class="text-right align-content-center">--%>
<%--        <a href="/logout">Se Deconnecter</a>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>

<%--  <nav class="py-0 bg-body-tertiary border-bottom text-center sticky-top shadow-sm">--%>
<%--    <div class="py-0">--%>
<%--      <!--                  <a class="navbar-brand" href="#">Hidden brand</a>-->--%>
<%--      <ul class="mb-0">--%>

<%--        <li class="_nav-item btn">--%>
<%--          <a href="" class="_nav-link">--%>
<%--            Dashboard--%>
<%--          </a>--%>
<%--        </li>--%>

<%--&lt;%&ndash;        <li class="dropdown btn _nav-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                              <span class="_nav-link dropdown-toggle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <%=anneeScolaire.getNom()%>&ndash;%&gt;--%>
<%--&lt;%&ndash;                              </span>&ndash;%&gt;--%>

<%--&lt;%&ndash;          <div class="dropdown-menu"&ndash;%&gt;--%>
<%--&lt;%&ndash;          >&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="dropdown-title">Annee Scolaire</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            &lt;%&ndash;%>--%>
<%--&lt;%&ndash;              for(AnneeScolaire as : anneeScolaires){&ndash;%&gt;--%>
<%--&lt;%&ndash;            %>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a href="/anneeScolaire/set?id=<%=as.getId()%>" class="dropdown-item"><%=as.getNom()%></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            &lt;%&ndash;%>--%>
<%--&lt;%&ndash;              }&ndash;%&gt;--%>
<%--&lt;%&ndash;            %>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </li>&ndash;%&gt;--%>

<%--        <li class="dropdown btn _nav-item">--%>
<%--                              <span class="_nav-link dropdown-toggle">--%>
<%--                                    Eleves--%>
<%--                              </span>--%>

<%--          <div class="dropdown-menu"--%>
<%--          >--%>
<%--            <div class="dropdown-title">Eleves</div>--%>
<%--            <a href="/eleve/critere-list" class="dropdown-item">Liste des élèves</a>--%>
<%--            <a href="/eleve/list" class="dropdown-item">Eleves par classe</a>--%>
<%--            <a href="/eleve/form" class="dropdown-item">Inscrire un élève</a>--%>
<%--            <a href="" class="dropdown-item">Bulletin de note</a>--%>
<%--            <a href="" class="dropdown-item">Absences</a>--%>
<%--            <a href="" class="dropdown-item">Comportements</a>--%>
<%--          </div>--%>
<%--        </li>--%>

<%--        <li class="dropdown btn _nav-item">--%>
<%--                              <span class="_nav-link dropdown-toggle">--%>
<%--                                    Pesonnels--%>
<%--                              </span>--%>

<%--          <div class="dropdown-menu"--%>
<%--          >--%>
<%--            <div class="dropdown-title">Personnels</div>--%>

<%--            <a href="" class="dropdown-item">Secretaires</a>--%>
<%--            <a href="/prof/form" class="dropdown-item">Professeurs</a>--%>
<%--          </div>--%>
<%--        </li>--%>

<%--        <li class="dropdown btn _nav-item">--%>
<%--                              <span class="_nav-link dropdown-toggle">--%>
<%--                                    Organisations--%>
<%--                              </span>--%>

<%--          <div class="dropdown-menu"--%>
<%--          >--%>
<%--            &lt;%&ndash;                        <a href="" class="dropdown-item">Niveau Scolaire</a>&ndash;%&gt;--%>
<%--            <div class="dropdown-title">Organisations</div>--%>

<%--            <a href="/classe/form" class="dropdown-item">Classe</a>--%>
<%--            <a href="/salle/form" class="dropdown-item">Salle</a>--%>
<%--            <a href="/niveau/form" class="dropdown-item">Niveau</a>--%>
<%--            <a href="/matiere/form" class="dropdown-item">Matière</a>--%>
<%--            <a href="/matiereProf/form" class="dropdown-item">Matière - Profs</a>--%>
<%--            &lt;%&ndash;                        <a href="/periodeExamen/form" class="dropdown-item">Periode d'Examen</a>&ndash;%&gt;--%>
<%--            <a href="/calendrier/form" class="dropdown-item">Calendrier Scolaire</a>--%>

<%--            <a href="" class="dropdown-item">Emploi du temps</a>--%>

<%--          </div>--%>
<%--        </li>--%>


<%--        <li class="dropdown btn _nav-item">--%>
<%--                              <span class="_nav-link dropdown-toggle">--%>
<%--                                    Communication--%>
<%--                              </span>--%>

<%--          <div class="dropdown-menu">--%>
<%--            <div class="dropdown-title">Communication</div>--%>
<%--            <a href="" class="dropdown-item">Communiqué</a>--%>
<%--            <a href="/convocation/form" class="dropdown-item">Convoquer</a>--%>
<%--            <a href="" class="dropdown-item">Rencontre</a>--%>
<%--            <a href="" class="dropdown-item">Confirmation Absence</a>--%>
<%--            <a href="" class="dropdown-item">Alerte</a>--%>
<%--          </div>--%>
<%--        </li>--%>

<%--        <li class="_nav-item btn">--%>
<%--          <a href="" class="_nav-link">--%>
<%--            Etablissement--%>
<%--          </a>--%>
<%--        </li>--%>

<%--        <li class="dropdown btn _nav-item">--%>
<%--                              <span class="_nav-link dropdown-toggle">--%>
<%--                                    Ecolages--%>
<%--                              </span>--%>

<%--          <div class="dropdown-menu"--%>
<%--          >--%>
<%--            <a href="/payeEcolage/form" class="dropdown-item">Prix</a>--%>
<%--            <a href="" class="dropdown-item">Ecolage non payé </a>--%>

<%--          </div>--%>
<%--        </li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--  </nav>--%>

<%--  <div class="container py-5">--%>
<%--    <jsp:include page="<%=pg%>"/>--%>
<%--  </div>--%>


<%--</main>--%>

<%--</body>--%>
<%--<script src="/assets/js/jquery-3.7.1.min.js"></script>--%>
<%--<script src="../assets/js/bootstrap.js"></script>--%>

<%--<script src="../assets/js/bootstrap.bundle.js"></script>--%>

<%--<script>--%>
<%--  function confirmSubmission(event, nom) {--%>
<%--    if (!confirm('Êtes-vous sûr de vouloir supprimer  ' + nom + " ?")) {--%>
<%--      event.preventDefault();--%>
<%--    }--%>
<%--  }--%>

<%--  function rollback() {--%>
<%--    window.location.reload();--%>
<%--  }--%>
<%--</script>--%>

<%--<!-- Include jQuery -->--%>
<%--&lt;%&ndash;<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>&ndash;%&gt;--%>
<%--<!-- Include Bootstrap JS -->--%>
<%--&lt;%&ndash;<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>&ndash;%&gt;--%>


