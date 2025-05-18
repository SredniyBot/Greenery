let docProf = document.getElementById('notif0');
if(docProf!=null){
    document.getElementById('notif0' ).addEventListener('click', function(e) {
        document.getElementById('notif0' ).setAttribute("checked","")
        document.getElementById('submit-news').click();
    });
    document.getElementById('notif1' ).addEventListener('click', function(e) {
        document.getElementById('notif1' ).setAttribute("checked","")
        document.getElementById('submit-news').click();
    });
    document.getElementById('notif2' ).addEventListener('click', function(e) {
        document.getElementById('notif2' ).setAttribute("checked","")
        document.getElementById('submit-news').click();
    });

}

