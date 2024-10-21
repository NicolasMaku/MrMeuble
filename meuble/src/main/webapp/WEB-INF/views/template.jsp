<%@page pageEncoding="UTF-8" %>

<%
    String header = "template/header.jsp";
    String footer = "template/footer.jsp";
    String content = (String) request.getAttribute("content");
    String sidebar = "";
    if(request.getAttribute("sidebar") != null) {
        sidebar += (String) request.getAttribute("sidebar");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/output.css">
    <link rel="stylesheet" href="/assets/style.css">
    <link rel="stylesheet" href="/assets/sidebar.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <title>Mr. Meuble</title>
</head>
<body class="overflow-hidden">
    <svg class="bgs absolute z-0" id="eBWIyf7iGnv1" xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision"
         text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625"
         export-id="94e49368974348cba6ad2bb61150d0c3" cached="false">
        <defs>
            <linearGradient id="eBWIyf7iGnv2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312"
                            spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)">
                <stop id="eBWIyf7iGnv2-fill-0" offset="0%" stop-color="#f3f7f9"/>
                <stop id="eBWIyf7iGnv2-fill-1" offset="0%" stop-color="#fff"/>
                <stop id="eBWIyf7iGnv2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/>
                <stop id="eBWIyf7iGnv2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/>
                <stop id="eBWIyf7iGnv2-fill-4" offset="100%" stop-color="#dee9ee"/>
            </linearGradient>
        </defs>
        <path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304"
              transform="matrix(1 0 0 0.784513-285.85945 79.243451)" fill="url(#eBWIyf7iGnv2-fill)" stroke-width="5.12"/>
    </svg>


    <svg class="bgs absolute z-0" id="eRYNvC8mAPq1" xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2560 1000" shape-rendering="geometricPrecision"
         text-rendering="geometricPrecision" project-id="8a736d06e89d453488ae787ec2786625"
         export-id="2dc69a17fd054190aba0f72fd98ed3df" cached="false">
        <defs>
            <linearGradient id="eRYNvC8mAPq2-fill" x1="0.458994" y1="1.017456" x2="0.458994" y2="0.281312"
                            spreadMethod="pad" gradientUnits="objectBoundingBox" gradientTransform="translate(0 0)">
                <stop id="eRYNvC8mAPq2-fill-0" offset="0%" stop-color="#f3f7f9"/>
                <stop id="eRYNvC8mAPq2-fill-1" offset="0%" stop-color="#fff"/>
                <stop id="eRYNvC8mAPq2-fill-2" offset="40.3228%" stop-color="#fcfdfd"/>
                <stop id="eRYNvC8mAPq2-fill-3" offset="65.8394%" stop-color="#f2f6f8"/>
                <stop id="eRYNvC8mAPq2-fill-4" offset="100%" stop-color="#dee9ee"/>
            </linearGradient>
        </defs>
        <path d="M285.85945,66.35304v1307.293918q256.195996,66.35304,591.661108,0c0-37.450621,0-124.835403,0-124.835403l-8.803025-267.242946c0-131.791043-64.761322-319.916369-96.833279-380.729676C667.799942,358.74226,454.54609,-269.841303,285.85945,66.35304"
              transform="matrix(-1 0 0 0.784513 2845.859449 88.94811)" fill="url(#eRYNvC8mAPq2-fill)" stroke-width="5.12"/>
    </svg>

    <jsp:include page="<%=header%>" />

    <%  if(!sidebar.equals("")) { %>

        <jsp:include page="<%=sidebar%>" />

    <% } %>

    <jsp:include page="<%=content%>" />

    <jsp:include page="<%=footer%>" />

    <script>
        function confirmSubmission(event, text) {
            // Display a confirmation dialog
            let confirmAction = confirm(text);

            // If the user clicks "Cancel", prevent form submission
            if (!confirmAction) {
                event.preventDefault();
            }
        }
    </script>


    <script src="/node_modules/preline/dist/preline.js"></script>
    <script src="/assets/js/gsap.min.js"></script>
    <script src="/assets/js/script.js"></script>
    <script src="/assets/js/sidebar.js"></script>
</body>
</html>