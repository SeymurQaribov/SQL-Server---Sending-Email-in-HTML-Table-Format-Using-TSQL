DECLARE @MAIL_BODY VARCHAR(8000)
 
/* HEADER */
SET @MAIL_BODY = '<table border="1" align="center" cellpadding="2" cellspacing="0" style="color:black;font-family:consolas;text-align:center;">' +
    '<tr>
    <th>m_id</th>
    <th>ad</th>
    <th>satis_qiymeti</th>
    <th>alis_qiymeti</th>
    </tr>'
 
/* ROWS */
SELECT
    @MAIL_BODY = @MAIL_BODY +
        '<tr>' +
        '<td>' + CAST(m_id AS VARCHAR(11)) + '</td>' +
        '<td>' + ad + '</td>' +
        '<td>' + CAST(satis_qiymeti AS VARCHAR(11)) + '</td>' +
        '<td>' + CAST(alis_qiymeti AS VARCHAR(11)) + '</td>' +
        '</tr>'
FROM
    dbo.mallar
 
SELECT @MAIL_BODY = @MAIL_BODY + '</table>'
 
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'your profile',
	@recipients = 'yourgmail',
    @subject = 'task',
    @body = @MAIL_BODY,
    @body_format='HTML';
	