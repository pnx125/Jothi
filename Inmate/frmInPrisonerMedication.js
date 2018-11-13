var grdInPrisonerMedication_EditModeRow ='';

function fn_ManipMedicationRow()
{
   	if(grdInPrisonerMedication_Validate())
	{
		if(grdInPrisonerMedication_EditModeRow =='')
		{
		    var row = nGrdAdd('grdInPrisonerMedication');
		    if (row != null) {
		        grdInPrisonerMedication_SetValues(row, "A");
		    }
		}
		else
		{
		    if(nGrdGCV(grdInPrisonerMedication_EditModeRow,'KPIID') =='')
		    {
		       grdInPrisonerMedication_SetValues(grdInPrisonerMedication_EditModeRow,'A'); //Add mode
			}
			else
			{
			   grdInPrisonerMedication_SetValues(grdInPrisonerMedication_EditModeRow,'C');// change mode
			}
		}
	}
	return false;
}

function grdInPrisonerMedication_Validate()
{
	return true;
}

function fn_CancelEditMecdicationeRow()
{
   	nSCV('cddEventType', '', 9);
   	nSCV('txtJob', '', 0);
	nSCV('txtDosage', '', 0);
	nSCV('txtAmt', '', 0);
	nSCV('txtCurBal', '', 0);
	nSCV('ChkGeneric', '', 3);
	nSCV('txtNotes', '', 0);

	grdInPrisonerMedication_EditModeRow ='';
	nChangeToAddMode_WithText('cmdAdd');
	return false;
}


function grdInPrisonerMedication_SetValues(row,Mode)
{
	nGrdSCV(row, 'Preecription', nGCV('cddEventType', 9));
    nGrdSCV(row,'Durg', nGCV('Drug', 0));
	nGrdSCV(row, 'Job', nGCV('txtJob', 0));
	nGrdSCV(row, 'Dosage', nGCV('txtDosage', 0));
	nGrdSCV(row, 'PrescribeAmt', nGCV('txtAmt', 0));
	nGrdSCV(row, 'CurBalance', nGCV('txtCurBal', 6));
	nGrdSCV(row, 'Refills', nGCV('ChkGeneric', 3));
	nGrdSCV(row, 'Note', nGCV('txtNotes', 6));

	GrdSCV(row, 'KPIMode', Mode);
	fn_CancelEditMecdicationeRow();
}

function grdInPrisonerMedication_CellClickHandler(sender, eventArgs)
{
    if (eventArgs.get_type() == 'cell') {
        grdInPrisonerMedication_EditModeRow = nGrdGSR('grdInPrisonerMedication');
        if (nGrdColKey(sender) == glbKPIGrdDelKey) {
            nGrdHandleDel('grdInPrisonerMedication');
            fn_CancelEditMecdicationeRow();
        }
        else {
          
            nSCV('cddEventType', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Preecription'), 9);
            nSCV('txtDrug', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Durg'), 0);
            nSCV('txtJob', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Job'), 0);
            nSCV('txtDosage', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Dosage'), 0);
            nSCV('txtAmt', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'PrescribeAmt'), 0);
            nSCV('txtCurBal', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'CurBalance'), 0);
            nSCV('ChkGeneric', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Refills'), 0);
            nSCV('txtNotes', nGrdGCV(grdInPrisonerMedication_EditModeRow, 'Note'), 0);

            nChangeToEditMode_WithText('cmdAdd');
        }
    }
}