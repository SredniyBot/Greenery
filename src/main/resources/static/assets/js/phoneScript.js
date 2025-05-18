let phoneTemp = document.getElementById('phoneInput');
if(phoneTemp!=null) {
    document.getElementById('phoneInput').addEventListener('input', function (e) {
        const re = new RegExp("^(\\+7|7|8)?[\\s\\-]?\\(?9[0-9]{2}\\)?[\\s\\-]?[0-9]{3}[\\s\\-]?[0-9]{2}[\\s\\-]?[0-9]{2}$");
        if (re.test(document.getElementById('phoneInput').value)) {
            document.getElementById('submitPhoneNumber').click();
        }
    });
}
