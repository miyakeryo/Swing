
function doTest(){
  var request = {
    parameter: {
      id: 2,
      param: 3,
      imageBase64: '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'
    }
  };
  doPost(request);
}

function doGet() {
  return HtmlService.createTemplateFromFile('onagawahtml')
    .evaluate() // evaluate MUST come before setting the NATIVE mode
    .setTitle('棒')
    .setSandboxMode(HtmlService.SandboxMode.NATIVE);
}

function processForm(formObject){
  var request = {parameter: formObject};
  doPost(request);
}

function doPost(request) {
  try{
    var ss = SpreadsheetApp.openById(PropertiesService.getScriptProperties().getProperty('active'));

    //エラーメールをto, 成功メールをbccで送るアドレス
    var adminEmail = ss.getOwner().getEmail();

    //エラー発生時に管理者に送るメールの件名
    var errorSubject = 'エラーが発生しました';

    var sheet, lastCol, lastRow, header;

    var data = {};
    data.id = request.parameter['id'];
    data.param = request.parameter['param'];

    // 生徒情報を参照するシート
    sheet = ss.getSheets()[1];
    lastRow = sheet.getLastRow();
    lastCol = sheet.getLastColumn();

    header = sheet.getRange(1, 1, 1, lastCol).getValues()[0];
    var idCol, nameCol, emailCol, parentCol;
    for (var col in header) {
      switch(header[col]){
        case 'id':
          idCol = col;
          break;
        case 'name':
          nameCol = col;
          break;
        case 'email':
          emailCol = col;
          break;
        case 'parent':
          parentCol = col;
          break;
      }
    }

    data.name = null;

    for(var row = 2; row <= lastRow; row++) {
      var rowData = sheet.getRange(row, 1, row, lastCol).getValues()[0];
      if(rowData[idCol]==data.id){
        data.name = rowData[nameCol];
        data.email = rowData[emailCol];
        data.parent = rowData[parentCol];
        break;
      }
    }
    if(data.name==null) return;

    // データを書き込むシート
    sheet = ss.getSheets()[2];
    lastRow = sheet.getLastRow();
    lastCol = sheet.getLastColumn();

    if (lastRow!==0 && lastCol!==0){
      header = sheet.getRange(1, 1, 1, lastCol).getValues()[0];
    }else{
      lastRow++;
    }

    var a1 = sheet.getRange('a1');

    for (var key in data ) {
      var value = data[key];
      var exist = false;
      for (var i in header) {
        if ( header[i] == key ){
          a1.offset(lastRow, i).setValue(value);
          exist = true;
          break;
        }
      }
      if (!exist){
        a1.offset(0, lastCol).setValue(key);
        a1.offset(lastRow, lastCol).setValue(value);
        lastCol++;
      }
    }

    //更新日時
    var updateAtName = 'update_at';
    if (lastCol > 0){
      header = sheet.getRange(1, 1, 1, lastCol).getValues()[0];
      var pos = header.indexOf(updateAtName);
      value = new Date();
      if (pos < 0){
        a1.offset(0, lastCol).setValue(updateAtName);
        a1.offset(lastRow, lastCol).setValue(value);
      }else{
        a1.offset(lastRow, pos).setValue(value);
      }
    }

    //メール
    var email = data.email;
    var subject = data.name + ' さんが向学館に着きました';
var body = '\
<!DOCTYPE html "-//w3c//dtd xhtml 1.0 transitional //en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head>\
    <!--[if gte mso 9]><xml>\
     <o:OfficeDocumentSettings>\
      <o:AllowPNG/>\
      <o:PixelsPerInch>96</o:PixelsPerInch>\
     </o:OfficeDocumentSettings>\
    </xml><![endif]-->\
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">\
    <meta name="viewport" content="width=device-width">\
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">\
    <title>Template Base</title>\
    \
    \
    \
</head>\
<body style="width: 100% !important;min-width: 100%;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100% !important;margin: 0;padding: 0;background-color: #FFFFFF">\
  <style id="media-query">\
    /* Client-specific Styles & Reset */\
    #outlook a {\
        padding: 0;\
    }\
\
    /* .ExternalClass applies to Outlook.com (the artist formerly known as Hotmail) */\
    .ExternalClass {\
        width: 100%;\
    }\
\
    .ExternalClass,\
    .ExternalClass p,\
    .ExternalClass span,\
    .ExternalClass font,\
    .ExternalClass td,\
    .ExternalClass div {\
        line-height: 100%;\
    }\
\
    #backgroundTable {\
        margin: 0;\
        padding: 0;\
        width: 100% !important;\
        line-height: 100% !important;\
    }\
\
    /* Buttons */\
    .button a {\
        display: inline-block;\
        text-decoration: none;\
        -webkit-text-size-adjust: none;\
        text-align: center;\
    }\
\
    .button a div {\
        text-align: center !important;\
    }\
\
    /* Outlook First */\
    body.outlook p {\
        display: inline !important;\
    }\
\
    /*  Media Queries */\
@media only screen and (max-width: 500px) {\
  table[class="body"] img {\
    height: auto !important;\
    width: 100% !important; }\
  table[class="body"] img.fullwidth {\
    max-width: 100% !important; }\
  table[class="body"] center {\
    min-width: 0 !important; }\
  table[class="body"] .container {\
    width: 95% !important; }\
  table[class="body"] .row {\
    width: 100% !important;\
    display: block !important; }\
  table[class="body"] .wrapper {\
    display: block !important;\
    padding-right: 0 !important; }\
  table[class="body"] .columns, table[class="body"] .column {\
    table-layout: fixed !important;\
    float: none !important;\
    width: 100% !important;\
    padding-right: 0px !important;\
    padding-left: 0px !important;\
    display: block !important; }\
  table[class="body"] .wrapper.first .columns, table[class="body"] .wrapper.first .column {\
    display: table !important; }\
  table[class="body"] table.columns td, table[class="body"] table.column td, .col {\
    width: 100% !important; }\
  table[class="body"] table.columns td.expander {\
    width: 1px !important; }\
  table[class="body"] .right-text-pad, table[class="body"] .text-pad-right {\
    padding-left: 10px !important; }\
  table[class="body"] .left-text-pad, table[class="body"] .text-pad-left {\
    padding-right: 10px !important; }\
  table[class="body"] .hide-for-small, table[class="body"] .show-for-desktop {\
    display: none !important; }\
  table[class="body"] .show-for-small, table[class="body"] .hide-for-desktop {\
    display: inherit !important; }\
  .mixed-two-up .col {\
    width: 100% !important; } }\
 @media screen and (max-width: 500px) {\
      div[class="col"] {\
          width: 100% !important;\
      }\
    }\
\
    @media screen and (min-width: 501px) {\
      table[class="container"] {\
          width: 500px !important;\
      }\
    }\
  </style>\
  <table class="body" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;height: 100%;width: 100%;table-layout: fixed" cellpadding="0" cellspacing="0" width="100%" border="0">\
      <tbody><tr style="vertical-align: top">\
          <td class="center" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;text-align: center;background-color: #FFFFFF" align="center" valign="top">\
\
              <table style="border-spacing: 0;border-collapse: collapse;vertical-align: top;background-color: #FFC058" cellpadding="0" cellspacing="0" align="center" width="100%" border="0">\
                <tbody><tr style="vertical-align: top">\
                  <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%">\
                    <!--[if gte mso 9]>\
                    <table id="outlookholder" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    <table width="500" align="center" cellpadding="0" cellspacing="0" border="0">\
                        <tr>\
                            <td>\
                    <![endif]-->\
                    <table class="container" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;max-width: 500px;margin: 0 auto;text-align: inherit" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%"><table class="block-grid" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;width: 100%;max-width: 500px;color: #000000;background-color: transparent" cellpadding="0" cellspacing="0" width="100%" bgcolor="transparent"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;text-align: center;font-size: 0"><!--[if (gte mso 9)|(IE)]><table width="100%" align="center" bgcolor="transparent" cellpadding="0" cellspacing="0" border="0"><tr><![endif]--><!--[if (gte mso 9)|(IE)]><td valign="top" width="500"><![endif]--><div class="col num12" style="display: inline-block;vertical-align: top;width: 100%"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;background-color: transparent;padding-top: 5px;padding-right: 0px;padding-bottom: 5px;padding-left: 0px;border-top: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-left: 0px solid transparent"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%" border="0">\
    <tbody><tr style="vertical-align: top">\
        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;width: 100%;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px" align="center">\
            <div style="font-size:12px" align="center">\
\
                <img class="center" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block;border: 0;height: auto;line-height: 100%;margin: 0 auto;float: none;width: 60px;max-width: 60px" align="center" border="0" src="cid:icon" alt="Image" title="Image" width="60">\
            </div>\
        </td>\
    </tr>\
</tbody></table>\
</td></tr></tbody></table></div><!--[if (gte mso 9)|(IE)]></td><![endif]--><!--[if (gte mso 9)|(IE)]></td></tr></table><![endif]--></td></tr></tbody></table></td></tr></tbody></table>\
                    <!--[if mso]>\
                    </td></tr></table>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    </td></tr></table>\
                    <![endif]-->\
                  </td>\
                </tr>\
              </tbody></table>\
              <table style="border-spacing: 0;border-collapse: collapse;vertical-align: top;background-color: #FFFFFF" cellpadding="0" cellspacing="0" align="center" width="100%" border="0">\
                <tbody><tr style="vertical-align: top">\
                  <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%">\
                    <!--[if gte mso 9]>\
                    <table id="outlookholder" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    <table width="500" align="center" cellpadding="0" cellspacing="0" border="0">\
                        <tr>\
                            <td>\
                    <![endif]-->\
                    <table class="container" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;max-width: 500px;margin: 0 auto;text-align: inherit" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%"><table class="block-grid" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;width: 100%;max-width: 500px;color: #000000;background-color: transparent" cellpadding="0" cellspacing="0" width="100%" bgcolor="transparent"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;text-align: center;font-size: 0"><!--[if (gte mso 9)|(IE)]><table width="100%" align="center" bgcolor="transparent" cellpadding="0" cellspacing="0" border="0"><tr><![endif]--><!--[if (gte mso 9)|(IE)]><td valign="top" width="500"><![endif]--><div class="col num12" style="display: inline-block;vertical-align: top;width: 100%"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;background-color: transparent;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;border-top: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-left: 0px solid transparent"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" align="center" width="100%" border="0" cellpadding="0" cellspacing="0">\
    <tbody><tr style="vertical-align: top">\
        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px" align="center">\
            <div style="height: 10px;">\
                <table style="border-spacing: 0;border-collapse: collapse;vertical-align: top;border-top: 10px solid transparent;width: 100%" align="center" border="0" cellspacing="0">\
                    <tbody><tr style="vertical-align: top">\
                        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" align="center"></td>\
                    </tr>\
                </tbody></table>\
            </div>\
        </td>\
    </tr>\
</tbody></table><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%">\
  <tbody><tr style="vertical-align: top">\
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px">\
        <div style="color:#555555;line-height:120%;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;">            \
          <div style="font-size:12px;line-height:14px;color:#555555;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;text-align:left;"><div class="txtTinyMce-wrapper" style="font-size:12px; line-height:14px;"><p style="margin: 0;font-size: 14px;line-height: 16px;text-align: center"><span style="color: rgb(128, 128, 128); font-size: 14px; line-height: 16px;">' + data.parent + ' &#12373;&#12435;</span></p></div></div>\
        </div>\
    </td>\
  </tr>\
</tbody></table>\
<table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%">\
  <tbody><tr style="vertical-align: top">\
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 20px;padding-right: 0px;padding-bottom: 20px;padding-left: 0px">\
        <div style="color:#ffffff;line-height:120%;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;">            \
          <div style="font-size:12px;line-height:14px;color:#ffffff;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;text-align:left;"><p style="margin: 0;font-size: 14px;line-height: 17px;text-align: center"><span style="color: rgb(255, 153, 0); font-size: 14px; line-height: 16px;"><strong><span style="font-size: 28px; line-height: 33px;">' + data.name + ' &#12373;&#12435;&nbsp;<span style="font-size: 16px; line-height: 19px;">&#12364;&#21521;&#23398;&#39208;&#12395;&#30528;&#12365;&#12414;&#12375;&#12383;</span></span></strong></span></p></div>\
        </div>\
    </td>\
  </tr>\
</tbody></table>\
<table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%">\
  <tbody><tr style="vertical-align: top">\
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px">\
        <div style="color:#555555;line-height:120%;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;">            \
          <div style="font-size:12px;line-height:14px;color:#555555;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;text-align:left;"><p style="margin: 0;font-size: 14px;line-height: 17px;text-align: center"><span style="color: rgb(128, 128, 128); font-size: 14px; line-height: 16px;">&#65340;&#30528;&#12356;&#12383;&#12424;&#12540;&#65281;&#65295;</span></p></div>\
        </div>\
    </td>\
  </tr>\
</tbody></table>\
<table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%" border="0">\
    <tbody><tr style="vertical-align: top">\
        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;width: 100%;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px" align="center">\
            <div style="font-size:12px" align="center">\
\
                <img class="center" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block;border: 0;height: auto;line-height: 100%;margin: 0 auto;float: none;width: 360px;max-width: 360px" align="center" border="0" src="cid:graph" alt="Image" title="Image" width="360">\
            </div>\
        </td>\
    </tr>\
</tbody></table>\
<table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" align="center" width="100%" border="0" cellpadding="0" cellspacing="0">\
    <tbody><tr style="vertical-align: top">\
        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 10px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px" align="center">\
            <div style="height: 10px;">\
                <table style="border-spacing: 0;border-collapse: collapse;vertical-align: top;border-top: 10px solid transparent;width: 100%" align="center" border="0" cellspacing="0">\
                    <tbody><tr style="vertical-align: top">\
                        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" align="center"></td>\
                    </tr>\
                </tbody></table>\
            </div>\
        </td>\
    </tr>\
</tbody></table></td></tr></tbody></table></div><!--[if (gte mso 9)|(IE)]></td><![endif]--><!--[if (gte mso 9)|(IE)]></td></tr></table><![endif]--></td></tr></tbody></table></td></tr></tbody></table>\
                    <!--[if mso]>\
                    </td></tr></table>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    </td></tr></table>\
                    <![endif]-->\
                  </td>\
                </tr>\
              </tbody></table>\
              <table style="border-spacing: 0;border-collapse: collapse;vertical-align: top;background-color: #00B756" cellpadding="0" cellspacing="0" align="center" width="100%" border="0">\
                <tbody><tr style="vertical-align: top">\
                  <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%">\
                    <!--[if gte mso 9]>\
                    <table id="outlookholder" border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    <table width="500" align="center" cellpadding="0" cellspacing="0" border="0">\
                        <tr>\
                            <td>\
                    <![endif]-->\
                    <table class="container" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;max-width: 500px;margin: 0 auto;text-align: inherit" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top" width="100%"><table class="block-grid" style="border-spacing: 0;border-collapse: collapse;vertical-align: top;width: 100%;max-width: 500px;color: #333;background-color: transparent" cellpadding="0" cellspacing="0" width="100%" bgcolor="transparent"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;text-align: center;font-size: 0"><!--[if (gte mso 9)|(IE)]><table width="100%" align="center" bgcolor="transparent" cellpadding="0" cellspacing="0" border="0"><tr><![endif]--><!--[if (gte mso 9)|(IE)]><td valign="top" width="500"><![endif]--><div class="col num12" style="display: inline-block;vertical-align: top;width: 100%"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" align="center" width="100%" border="0"><tbody><tr style="vertical-align: top"><td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;background-color: transparent;padding-top: 30px;padding-right: 0px;padding-bottom: 30px;padding-left: 0px;border-top: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;border-left: 0px solid transparent"><table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%">\
  <tbody><tr style="vertical-align: top">\
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 15px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px">\
        <div style="color:#ffffff;line-height:120%;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;">            \
          <div style="font-size:12px;line-height:14px;color:#ffffff;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;text-align:left;"><p style="margin: 0;font-size: 18px;line-height: 22px;text-align: center"><span style="font-size: 18px; line-height: 21px;">&#12371;&#12398;&#12513;&#12483;&#12475;&#12540;&#12472;&#12399;&#39764;&#27861;&#12398;&#26454;&#12391;&#36865;&#12425;&#12428;&#12414;&#12375;&#12383;</span></p></div>\
        </div>\
    </td>\
  </tr>\
</tbody></table>\
<table style="border-spacing: 0;border-collapse: collapse;vertical-align: top" cellpadding="0" cellspacing="0" width="100%">\
  <tbody><tr style="vertical-align: top">\
    <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top;padding-top: 0px;padding-right: 10px;padding-bottom: 10px;padding-left: 10px">\
        <div style="color:#B8B8C0;line-height:150%;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;">            \
          <div style="font-size:12px;line-height:18px;text-align:center;color:#B8B8C0;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;"><p style="margin: 0;font-size: 12px;line-height: 18px;text-align: center"><span style="color: rgb(255, 255, 255); font-size: 12px; line-height: 18px;">// developed by Field Hack Onagawa Team F //</span></p></div><div style="font-size:12px;line-height:18px;color:#B8B8C0;font-family:Arial, \'Helvetica Neue\', Helvetica, sans-serif;text-align:left;"><p style="margin: 0;font-size: 14px;line-height: 21px;text-align: center"><span style="font-size: 14px; line-height: 21px;"></span></p></div>\
        </div>\
    </td>\
  </tr>\
</tbody></table>\
</td></tr></tbody></table></div><!--[if (gte mso 9)|(IE)]></td><![endif]--><!--[if (gte mso 9)|(IE)]></td></tr></table><![endif]--></td></tr></tbody></table></td></tr></tbody></table>\
                    <!--[if mso]>\
                    </td></tr></table>\
                    <![endif]-->\
                    <!--[if (IE)]>\
                    </td></tr></table>\
                    <![endif]-->\
                  </td>\
                </tr>\
              </tbody></table>\
          </td>\
      </tr>\
  </tbody></table>\
\
\
</body></html>\
';

    var imageBlob;
    if(request.parameter.image!=null){
      imageBlob = request.parameter.image;
    }else{
      var imageBase64 = request.parameter.imageBase64;
      var decoded = Utilities.base64Decode(imageBase64);
      imageBlob = Utilities.newBlob(decoded, 'image/jpeg');
    }
    
    var iconBase64 = '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';
    var iconBlob = Utilities.newBlob(Utilities.base64Decode(iconBase64), 'image/png');
    
    //送信
    MailApp.sendEmail({to:email, bcc:adminEmail, subject:subject, htmlBody:body, inlineImages:{graph:imageBlob,icon:iconBlob}, noReply:true});
    
    var result = {result:'ok'};
    return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
  } catch(e) {
    MailApp.sendEmail(adminEmail, errorSubject, e);
    var result = {result:'error',error:e};
    return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
  }
}

function setUp() {
  PropertiesService.getScriptProperties().setProperty('active', SpreadsheetApp.getActiveSpreadsheet().getId());
}
