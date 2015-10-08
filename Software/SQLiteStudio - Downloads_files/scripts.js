function hideCookies()
{
    document.getElementById('cookiesDiv').style.display = 'none';
    setCookie('hideCookiesClause', '1');
}

function checkForCookies()
{
    var ck = getCookie('hideCookiesClause');
    if (ck == '1')
        document.getElementById('cookiesDiv').style.display = 'none';
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function highlightBtn(btn)
{
    if (btn.className == 'topBarBtnGold')
        btn.className='topBarBtnGoldHg';
    else
        btn.className='topBarBtnHg';
}

function normalBtn(btn)
{
    if (btn.className == 'topBarBtnGoldHg')
        btn.className='topBarBtnGold';
    else
        btn.className='topBarBtn';
}

function topButtonClicked(param)
{
        if (param == "forum")
                document.location = "http://forum.sqlitestudio.pl";
        else
                document.location = "?act="+param;
}

// Preloading images, if supported by webbrowser
if (document.images)
{
        var tmpPic = new Image(100, 25);
        tmpPic.src = 'img/button_gradient_hg.png';
        tmpPic.src = 'img/button_gradient_gold_hg.png';
}

