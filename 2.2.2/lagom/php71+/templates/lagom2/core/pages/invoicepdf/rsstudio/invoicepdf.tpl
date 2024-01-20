<?php

if(function_exists('RSThemeCAVars')){
    $tplvars['templatefile'] = 'invoicepdf';
    $RSThemes = RSThemeCAVars($tplvars);
}
if(function_exists('invoiceVars')){
    $RSThemes['rcinvoice'] = $rcinvoice;
    $vars = invoiceVars($RSThemes);
    foreach($vars as $var => $value){
        $var = $value;
    }
}
if(strstr($paymentmethod,"Bank Transfer")){
    $bankTransfer=true;
}   



$startpage = $pdf->GetPage();

/* * * * * * * * * * * * * * * *
 *
 * Logo
 *
 * * * * * * * * * * * * * * * */

$logoFilename = 'placeholder.png';
if (file_exists(ROOTDIR . '/assets/img/logo.png')) {
$logoFilename = 'logo.png';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpg')) {
$logoFilename = 'logo.jpg';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpeg')) {
$logoFilename = 'logo.jpeg';
}

$pdf->Image(ROOTDIR . '/assets/img/' . $logoFilename, 10,10,'','12');

/* * * * * * * * * * * * * * * *
 *
 * Company Details
 *
 * * * * * * * * * * * * * * * */

$pdf->SetXY(137,9);
$pdf->SetCellPaddings(5,0,5,0);
$pdf->SetTextColor(0,0,0);
$pdf->SetFont($pdfFont,'B',9);
$pdf->Cell(160,5,trim($companyaddress[0]),0,1,'L');
$pdf->SetFont($pdfFont,'',9);
$i = 0;
foreach ($companyaddress as $addressLine) {
    if ($i > 0){
        $pdf->SetX(137);
        $pdf->Cell(0, 5, trim($addressLine), 0, 1, 'L');
    }
    $i++;
}

if($i < 4) {
    $i = '4';
}

if ($taxCode) {
    $pdf->SetX(137);
    $pdf->Cell(0, 5, $taxIdLabel . ': ' . trim($taxCode), 0, 1, 'L');
}

/* * * * * * * * * * * * * * * *
 *
 * Status Bar
 *
 * * * * * * * * * * * * * * * */

$invoiceprefix = $pagetitle;

$pdf->SetXY(0,(($i * 5) + 19));

$pdf->SetFont($pdfFont,'',24);

# Set Status Bar Color
if ($status=="Paid") {
    $pdf->SetFillColor(61,212,126);
}elseif ($status=="Cancelled") {
   $pdf->SetFillColor(182,184,186);
} elseif ($status=="Refunded") {
    $pdf->SetFillColor(61,142,255);
} elseif ($status=="Collections") {
    $pdf->SetFillColor(255,145,66);
} elseif ($status=="Unpaid"){
    $pdf->SetFillColor(255,100,97);
}
$pdf->SetCellPaddings(17,0,5,0);
$pdf->SetTextColor(255,255,255);
$pdf->Cell(0,20,$invoiceprefix,0,1,'L','1');

$pdf->SetXY(137,(($i * 5) + 19));
$pdf->SetCellPaddings(5,0,5,0);
$pdf->Cell(0,20,$_LANG['invoices'.strtolower($status)],0,1,'L','1');

/* * * * * * * * * * * * * * * *
 *
 * Client Details
 *
 * * * * * * * * * * * * * * * */

$pdf->SetXY(15.5,(($i * 7) + 37));
$pdf->SetFont($pdfFont,'',9);

$tblhtml = '
    <table width="100%" bgcolor="#fff" cellspacing="0" cellpadding="7" border="0" style="color: #45474c;">
        <tr>
            <td width="25%" style="font-size: 8px; line-height: 16px; color: #a1a5b3; font-weight: bold">'.$_LANG["invoicesdatecreated"].'
            '.(($status=="Unpaid" || $RSThemes['RSThemes']['pages']['invoicepdf']['config']['displayDueWhenPaid']) ? "<br/>".$_LANG["invoicesdatedue"] : "").'
            '.($status=="Paid" ? "<br/>PAID" : "").'
            </td>
            <td width="44.2%" style="font-size: 9px; line-height: 16px;">'.$datecreated.'
            '.(($status=="Unpaid" || $RSThemes['RSThemes']['pages']['invoicepdf']['config']['displayDueWhenPaid']) ? "<br/>".$duedate : "").'
            '.($status=="Paid" ? "<br/> ".$paymentmethod.", ".$datepaid : "").'
            </td>
            <td width="30%" style="font-size: 9px; line-height: 16px;"><span style="font-size: 8px; line-height: 16px; color: #a1a5b3; font-weight: bold">'.$_LANG['invoicesinvoicedto'].'</span><br/>
                '.($clientsdetails["companyname"] ? "<strong>".$clientsdetails["companyname"]."</strong>" : "").'<br />
                '.$clientsdetails["firstname"]." ".$clientsdetails["lastname"].'<br />
                '.$clientsdetails["address1"].", ".($clientsdetails["address2"] ? $clientsdetails["address2"]: "")."<br/>".'
                '.$clientsdetails["city"].", ".$clientsdetails["state"].", ".$clientsdetails["postcode"].'<br />
                '.$clientsdetails["country"].'<br />';
                if (array_key_exists('tax_id', $clientsdetails) && $clientsdetails['tax_id']) {
                    $tblhtml .= $taxIdLabel . ': ' . $clientsdetails["tax_id"].'<br />';
                }
                if ($customfields) {    
                    foreach ($customfields AS $customfield ) {
                        $tblhtml .= $customfield['fieldname'].': '.$customfield['value'].'<br />';
                    }
                }
        $tblhtml .= '</td></tr></table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(-2);
$pdf->setX(0);

/* * * * * * * * * * * * * * * *
 *
 * Invoice Items
 *
 * * * * * * * * * * * * * * * */

$tblhtml = '<style>
table tr td { border-bottom: 1px solid #fff; color: #45474c; line-height:16px; font-weight: normal;}
table tr td.subtotal { color: #a1a5b3; }
</style>';

$tblhtml .= '<table width="100%" bgcolor="#fff" cellspacing="0" cellpadding="8" border="0">
    <tr bgcolor="#fff" valign="middle" style="font-weight:bold; font-size: 8px; color: #a1a5b3;">
        <th width="7.9%"></th>
        <th width="63.8%">'.$_LANG['invoicesdescription'].'</th>
        <th width="28.3%">'.$_LANG['quotelinetotal'].'</th>
    </tr>';
foreach ($invoiceitems AS $item) {
    $tblhtml .= '
    <tr valign="middle" >
        <td style="line-height: 18px;"></td>
        <td bgcolor="#edf0f2">'.nl2br($item['description'], TRUE).'</td>
        <td bgcolor="#edf0f2" >'.$item['amount'].'</td>
    </tr>';
}
$tblhtml .= '
    <tr height="20" bgcolor="#fff" valign="middle">
        <td style="line-height: 8px;"></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #a1a5b3; line-height: 8px;">'.$_LANG['invoicessubtotal'].'</td>
        <td style="font-weight:bold; line-height: 8px;">'.$subtotal.'</td>
    </tr>';
if ($taxname) $tblhtml .= '
    <tr bgcolor="#fff" valign="middle">
        <td style="line-height: 8px;"></td>
        <td align="right" style="font-weight:bold; line-height: 8px; font-size: 8px; color: #a1a5b3;">'.$taxrate.'% '.$taxname.'</td>
        <td style="font-weight:bold; line-height: 8px;">'.$tax.'</td>
    </tr>';
if ($taxname2) $tblhtml .= '
    <tr bgcolor="#fff" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; line-height: 8px; font-size: 8px; color: #a1a5b3;">'.$taxrate2.'% '.$taxname2.'</td>
        <td style="font-weight:bold; line-height: 8px;">'.$tax2.'</td>
    </tr>';
$tblhtml .= '
    <tr bgcolor="#fff" valign="middle">
        <td style="line-height: 8px;"></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #a1a5b3; line-height: 8px;">'.$_LANG['invoicescredit'].'</td>
        <td style="font-weight:bold; line-height: 8px;">'.$credit.'</td>
    </tr>
';
if ($status=="Paid") {
    $tblhtml .= '
    <tr height="30" bgcolor="#25c268" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #fff;">'.$_LANG['invoicestotal'].'</td>
        <td align="left" bgcolor="#3dd47e" style="font-weight:bold; color: #fff;">'.$total.'</td>
    </tr>';
}
elseif ($status=="Cancelled") {
    $tblhtml .= '
    <tr height="30" bgcolor="#a2a4a6" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; color: #fff;">'.$_LANG['invoicestotal'].'</td>
        <td bgcolor="#b6b8ba" align="left" style="font-weight:bold; color: #fff;">'.$total.'</td>
    </tr>';
} 
elseif ($status=="Refunded") {
    $tblhtml .= '
    <tr height="30" bgcolor="#3780e6" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #fff;">'.$_LANG['invoicestotal'].'</td>
        <td bgcolor="#3d8eff" align="left" style="font-weight:bold; color: #fff;">'.$total.'</td>
    </tr>';
} 
elseif ($status=="Collections") {
    $tblhtml .= '
    <tr height="20" bgcolor="#ff7919" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #fff;">'.$_LANG['invoicestotal'].'</td>
        <td bgcolor="#ff9142" align="left" style="font-weight:bold; color: #fff;">'.$total.'</td>
    </tr>';
} 
elseif ($status=="Unpaid"){
    $tblhtml .= '
    <tr height="30" bgcolor="#f44945" valign="middle">
        <td></td>
        <td align="right" style="font-weight:bold; font-size: 8px; color: #fff;">'.$_LANG['invoicestotal'].'</td>
        <td align="left" bgcolor="#ff6461" style="font-weight:bold; color: #fff;">'.$total.'</td>
    </tr>';
}

$tblhtml .= '</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

/* * * * * * * * * * * * * * * *
 *
 * Invoice Transactions
 *
 * * * * * * * * * * * * * * * */

$pdf->SetFont($pdfFont,'',16);
$pdf->SetTextColor(69,71,76);
$pdf->Cell(0,4,$_LANG["invoicestransactions"],0,1);

$pdf->Ln(6);

$pdf->SetFont($pdfFont,'',9);

$tblhtml = '
<table width="100%" bgcolor="#fff" cellspacing="0" cellpadding="8" border="0">
    <thead>
        <tr bgcolor="#fff" valign="middle" style="font-weight:bold; font-size: 8px; color: #a1a5b3;">
            <th width="23%">'.$_LANG['invoicestransdate'].'</th>
            <th width="23%">'.$_LANG['invoicestransgateway'].'</th>
            <th width="23%">'.$_LANG['invoicestransid'].'</th>
            <th width="31%">'.$_LANG['invoicestransamount'].'</th>
        </tr>
    </thead>';

    if (!count($transactions)) {
    $tblhtml .= '
    <tr bgcolor="#fff">
        <td colspan="4" align="center"  bgcolor="#edf0f2">'.$_LANG['invoicestransnonefound'].'</td>
    </tr>';
    } else {
        foreach ($transactions AS $trans) {
            $tblhtml .= '
            <tr height="30" bgcolor="#fff" style="font-weight:bold;">
                <td width="23%" bgcolor="#edf0f2">'.$trans['date'].'</td>
            ';
            $tblhtml .= '<td width="23%" bgcolor="#edf0f2">'.$trans['gateway'].'</td> ';
            $tblhtml .= '
            <td width="22%" bgcolor="#edf0f2">'.$trans['transid'].'</td>
            <td width="30%" bgcolor="#edf0f2">'.$trans['amount'].'</td>
            </tr>';
        }
    }
    $tblhtml .= '
    <tr height="30" bgcolor="#fff" style="font-weight:bold;">
        <td width="23%"></td>
        <td width="23%"></td>
        <td width="22%" align="right" style="color: #a1a5b3;">'.$_LANG['invoicesbalance'].'</td>
        <td width="30%">'.$balance.'</td>
    </tr>
</table>';

$pdf->writeHTML($tblhtml, true, false, false, false, '');

if ($notes) {
    $pdf->Ln(5);
    $pdf->SetX(12.5);
    $pdf->SetFont($pdfFont,'',8);
    $pdf->MultiCell(167,0,$_LANG['invoicesnotes'].": $notes");
}
$bankData .= '<div class="section"><h3 clas="section-title">'.$rslang->trans('billing.invoice.bank_transfer_details').'</h3><div class="section-body">'.$paymentbutton.'</div></div>'; 
if ($bankTransfer && $RSThemes['RSThemes']['pages']['invoicepdf']['config']['displayBankDetailsOnInvoice'] && $paymentbutton != ""){
    $pdf->writeHTML($bankData, true, false, false, false, '');
}

?>