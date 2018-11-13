using KPI.Framework.Setup;
using KPI.Global;
using KPI.Global.Helper;
using KPI.Global.StateMachine;
using KPI.Phoenix.Inmate;
using KPI.Phoenix.Object.Inmate;
using System;
using System.Collections.Specialized;
using KPI.Phoenix.Helper;

namespace KPI.PhoenixWeb.Inmate
{
    /// <summary>
    /// Summary description for InmateXML.
    /// </summary>
    public partial class InmateXML : BasePage
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            try
            {
                LoadData();
            }
            catch (Exception objErr)
            {
                ShowMsg(MsgType.Error, FrwkMsg.OP_FAIL, objErr);
            }
        }

        protected void LoadData()
        {
            try
            {
                KPITrace.Debug(TraceWeight.Five, "Getting Prescription History info from JmmMedPresHist DB.");
                string sCaller = "";
                NameValueCollection nvcXMLResponseData = new NameValueCollection();

                NameValueCollection nvcXMLPOSTData = GetKPIXMLPOSTData();

                sCaller = nvcXMLPOSTData.Get("Caller") == null ? string.Empty : nvcXMLPOSTData.Get("Caller");

                if (sCaller.Equals("RefillHist"))
                {
                    string sMode, sActDttm, sBalQuan, sPresID, sRefill, sBalRefill = "";

                    sMode = nvcXMLPOSTData.Get("Mode") == null ? string.Empty : nvcXMLPOSTData.Get("Mode");
                    sActDttm = nvcXMLPOSTData.Get("ActivityDate") == null ? string.Empty : nvcXMLPOSTData.Get("ActivityDate");
                    sPresID = nvcXMLPOSTData.Get("PrescId") == null ? string.Empty : nvcXMLPOSTData.Get("PrescId");
                    sBalQuan = nvcXMLPOSTData.Get("BalQuan") == null ? string.Empty : nvcXMLPOSTData.Get("BalQuan");
                    sRefill = nvcXMLPOSTData.Get("Refills") == null ? string.Empty : nvcXMLPOSTData.Get("Refills");
                    sBalRefill = nvcXMLPOSTData.Get("RefillBal") == null ? string.Empty : nvcXMLPOSTData.Get("RefillBal");
                    ///JmmMedPresHist--Adding into prescription History table
                    JmmMedPresHist objJmmMedPresHist = new JmmMedPresHist();
                    JmmMedPresHistBL objJmmMedPresHistBL = new JmmMedPresHistBL();
                    objJmmMedPresHist.MedPrescribeID = KPIHlp.CVI64(sPresID);
                    objJmmMedPresHist.JurisID = GetPageJuris();
                    objJmmMedPresHist.MedPresHistID = KPICounter.GetCounterID(objJmmMedPresHist.JurisID);
                    objJmmMedPresHist.ActivityDttm = KPIHlp.CVDttm(sActDttm);
                    objJmmMedPresHist.BalanceQty = KPIHlp.CVI32(sBalQuan);
                    objJmmMedPresHist.DispenseQty = 0;
                    objJmmMedPresHist.FillQty = KPIHlp.CVI32(sRefill);
                    objJmmMedPresHist.IsFill = 1;
                    objJmmMedPresHist.OfficerPFID = State.sPFID;
                    objJmmMedPresHist.PendRefills = KPIHlp.CVI32(sBalRefill);
                    ////Updating Prescription Table on refill.
                    JmmMedPrescribe objMedPres = new JmmMedPrescribe();
                    JmmMedPrescribeBL objMedPresBL = new JmmMedPrescribeBL();

                    objMedPres.MedPrescribeID = KPIHlp.CVI64(sPresID);
                    objMedPres.JurisID = GetPageJuris();
                    objMedPres.CurQuantity = KPIHlp.CVI32(sBalQuan);
                    objMedPres.RefillBal = KPIHlp.CVI16(sBalRefill);

                    if (sMode.Equals("A"))
                    {
                        objJmmMedPresHistBL.Insert(objJmmMedPresHist);
                        objMedPresBL.UpdateBalance(objMedPres);
                        nvcXMLResponseData.Add("PrescrpHistId", objJmmMedPresHist.MedPresHistID.ToString());
                        nvcXMLResponseData.Add("PFid", objJmmMedPresHist.OfficerPFID.ToString());
                    }
                    else
                    {
                        objJmmMedPresHistBL.Update(objJmmMedPresHist);
                        nvcXMLResponseData.Add("PrescrpHistId", objJmmMedPresHist.MedPresHistID.ToString());
                    }
                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
                else if (sCaller.Equals("PrescripUseEnd"))
                {
                    string sMode, sUseEnd, sComments, sPresID = "";
                    int result = 0;
                    sMode = nvcXMLPOSTData.Get("Mode") == null ? string.Empty : nvcXMLPOSTData.Get("Mode");
                    sUseEnd = nvcXMLPOSTData.Get("UseEnd") == null ? string.Empty : nvcXMLPOSTData.Get("UseEnd");
                    sComments = nvcXMLPOSTData.Get("comments") == null ? string.Empty : nvcXMLPOSTData.Get("comments");
                    sPresID = nvcXMLPOSTData.Get("PrescId") == null ? string.Empty : nvcXMLPOSTData.Get("PrescId");

                    JmmMedPrescribe objJmmPresc = new JmmMedPrescribe();
                    JmmMedPrescribeBL objJmmPrescBL = new JmmMedPrescribeBL();
                    objJmmPresc.MedPrescribeID = KPIHlp.CVI64(sPresID);
                    objJmmPresc.EndedDttm = KPIHlp.CVDttm(sUseEnd);
                    objJmmPresc.PrescribeNotes = sComments;
                    objJmmPresc.JurisID = GetPageJuris();
                    if (sMode.Equals("C"))
                    {
                        try
                        {
                            result = objJmmPrescBL.UpdateUseEnd(objJmmPresc);
                        }
                        catch (Exception ex)
                        {
                            string exp = ex.Message;
                        }
                        if (result == 1)
                            nvcXMLResponseData.Add("Success", "1");
                        else
                            nvcXMLResponseData.Add("Success", "0");
                    }

                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
            }
            catch (Exception objErr)
            {
                if (!objErr.Message.StartsWith("Thread was being aborted"))
                {
                    string sErrMsg = "Invalid XML Request String" + objErr.Message;
                    Response.Write(sErrMsg);
                    Response.End();
                    //return;
                }
            }

            try
            {
                KPITrace.Debug(TraceWeight.Five, "Getting Doctor info from JmsDoctor DB.");

                string sDoctor, sCallertype = "";
                string sDrug, sDosage, sPrescribedAmt, sRefills, sGenericAllowed, sNotes, sPresID, sVisitID, sBookID, sMode, sCurBalance = "";
                string JurisID = string.Empty;
                string JMMDentVisitID = string.Empty;
                string RecType = string.Empty;
                string JMMMedVisitID = string.Empty;
                NameValueCollection nvcXMLPOSTData = GetKPIXMLPOSTData();
                NameValueCollection nvcXMLResponseData = new NameValueCollection();
                sCallertype = nvcXMLPOSTData.Get("CallerType") == null ? string.Empty : nvcXMLPOSTData.Get("CallerType");
                if (sCallertype.Equals("PrimaryDoctor"))
                {
                    sDoctor = nvcXMLPOSTData.Get("Doctor") == null ? string.Empty : nvcXMLPOSTData.Get("Doctor");
                    JmsDoctor objJmsDoc = new JmsDoctor();
                    JmsDoctorBL objJmsDocBL = new JmsDoctorBL();
                    //bool blnValid = false;

                    if (sDoctor != null && sDoctor != string.Empty)
                    {
                        objJmsDoc.DoctorID = KPIHlp.CVI64(sDoctor);
                        objJmsDoc.JurisID = GetPageJuris();
                        objJmsDoc.IsDental = 0;
                        objJmsDoc = objJmsDocBL.SelectDoctor(ref objJmsDoc);

                        if (objJmsDoc != null)
                        {
                            nvcXMLResponseData.Add("location", objJmsDoc.Location);
                            nvcXMLResponseData.Add("Phone", objJmsDoc.PhoneNbr);
                            nvcXMLResponseData.Add("PhoneType", objJmsDoc.PhoneType);
                        }
                        else
                        {
                            nvcXMLResponseData.Add("location", "");
                            nvcXMLResponseData.Add("Phone", "");
                            nvcXMLResponseData.Add("PhoneType", "");
                        }

                        Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                        Response.End();
                    }
                }
                else if (sCallertype.Equals("PrimaryDentist"))
                {
                    sDoctor = nvcXMLPOSTData.Get("Doctor") == null ? string.Empty : nvcXMLPOSTData.Get("Doctor");
                    JmsDoctor objJmsDoc = new JmsDoctor();
                    JmsDoctorBL objJmsDocBL = new JmsDoctorBL();
                    //bool blnValid = false;

                    if (sDoctor != null && sDoctor != string.Empty)
                    {
                        objJmsDoc.DoctorID = KPIHlp.CVI64(sDoctor);
                        objJmsDoc.JurisID = GetPageJuris();
                        objJmsDoc.IsDental = 1;
                        objJmsDoc = objJmsDocBL.SelectDentist(objJmsDoc.DoctorID);

                        if (objJmsDoc != null)
                        {
                            nvcXMLResponseData.Add("location", objJmsDoc.Location);
                            nvcXMLResponseData.Add("Phone", objJmsDoc.PhoneNbr);
                            nvcXMLResponseData.Add("PhoneType", objJmsDoc.PhoneType);
                        }
                        else
                        {
                            nvcXMLResponseData.Add("location", "");
                            nvcXMLResponseData.Add("Phone", "");
                            nvcXMLResponseData.Add("PhoneType", "");
                        }

                        Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                        Response.End();
                    }
                }
                else if (sCallertype.Equals("Prescription"))
                {
                    sDrug = nvcXMLPOSTData.Get("Drug") == null ? string.Empty : nvcXMLPOSTData.Get("Drug");
                    sDosage = nvcXMLPOSTData.Get("Dosage") == null ? string.Empty : nvcXMLPOSTData.Get("Dosage");
                    sPrescribedAmt = nvcXMLPOSTData.Get("PrescribedAmt") == null ? string.Empty : nvcXMLPOSTData.Get("PrescribedAmt");
                    sRefills = nvcXMLPOSTData.Get("Refills") == null ? string.Empty : nvcXMLPOSTData.Get("Refills");
                    sGenericAllowed = nvcXMLPOSTData.Get("GenericAllowed") == null ? string.Empty : nvcXMLPOSTData.Get("GenericAllowed");
                    sNotes = nvcXMLPOSTData.Get("Notes") == null ? string.Empty : nvcXMLPOSTData.Get("Notes");
                    sVisitID = nvcXMLPOSTData.Get("VisitId") == null ? string.Empty : nvcXMLPOSTData.Get("VisitId");
                    sBookID = nvcXMLPOSTData.Get("BookId") == null ? string.Empty : nvcXMLPOSTData.Get("BookId");
                    sMode = nvcXMLPOSTData.Get("Mode") == null ? string.Empty : nvcXMLPOSTData.Get("Mode");
                    sPresID = nvcXMLPOSTData.Get("Prescriptionid") == null ? string.Empty : nvcXMLPOSTData.Get("Prescriptionid");

                    JmmMedPrescribe objJmmPresc = new JmmMedPrescribe();
                    JmmMedPrescribeBL objJmmPrescBL = new JmmMedPrescribeBL();
                    objJmmPresc.Dosage = sDosage.ToString();
                    objJmmPresc.Drug = sDrug.ToString();
                    objJmmPresc.PrescribedAmt = KPIHlp.CVI32(sPrescribedAmt.ToString());
                    objJmmPresc.Refills = KPIHlp.CVI32(sRefills.ToString());
                    if (sGenericAllowed.ToString().Equals("true"))
                        objJmmPresc.IsGeneric = 1;
                    else
                        objJmmPresc.IsGeneric = 0;

                    objJmmPresc.CurQuantity = KPIHlp.CVI32(sPrescribedAmt.ToString());
                    //need to change
                    objJmmPresc.cMode = KPIHlp.CVC(sMode);
                    objJmmPresc.IsPersonalProp = 0;
                    //need to pass
                    objJmmPresc.JMBookingID = KPIHlp.CVI64(sBookID.ToString());
                    objJmmPresc.JurisID = GetPageJuris();

                    objJmmPresc.MedVisitID = KPIHlp.CVI64(sVisitID.ToString());
                    objJmmPresc.RefillBal = KPIHlp.CVI16(sRefills.ToString());
                    objJmmPresc.Times = 0;
                    //objJmmPresc.Times="";
                    objJmmPresc.PrescribeNotes = sNotes.ToString();
                    if (sMode.Equals("A"))
                    {
                        objJmmPresc.MedPrescribeID = KPICounter.GetCounterID(objJmmPresc.JurisID);
                        objJmmPrescBL.Insert(objJmmPresc);
                        nvcXMLResponseData.Add("PrescriptionId", objJmmPresc.MedPrescribeID.ToString());
                    }
                    else
                    {
                        objJmmPresc.MedPrescribeID = KPIHlp.CVI64(sPresID);
                        objJmmPrescBL.Update(objJmmPresc);
                        //get id from grd
                        nvcXMLResponseData.Add("PrescriptionId", objJmmPresc.MedPrescribeID.ToString());
                    }

                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
                #region
                else if (sCallertype == "DentistEntryNotes")
                {
                    JMMDentVisitID = nvcXMLPOSTData.Get("JMMDentVisitID") == null ? string.Empty : nvcXMLPOSTData.Get("JMMDentVisitID").ToString();
                    JurisID = nvcXMLPOSTData.Get("JurisID") == null ? string.Empty : nvcXMLPOSTData.Get("JurisID").ToString();
                    RecType = nvcXMLPOSTData.Get("RecType") == null ? string.Empty : nvcXMLPOSTData.Get("RecType").ToString();

                    sNotes = new CMSHlp().GetCommentNotes(Convert.ToInt64(JMMDentVisitID), KPIHlp.CVI32(RecType));

                    if (!string.IsNullOrEmpty(sNotes))
                    {
                        nvcXMLResponseData.Add("Notes", sNotes);
                    }
                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
                #endregion

                #region Medical Visit Facility Notes
                else if (sCallertype == "MedicalVisitNotes")
                {
                    JMMMedVisitID = nvcXMLPOSTData.Get("JMMMedVisitID") == null ? string.Empty : nvcXMLPOSTData.Get("JMMMedVisitID").ToString();
                    JurisID = nvcXMLPOSTData.Get("JurisID") == null ? string.Empty : nvcXMLPOSTData.Get("JurisID").ToString();
                    RecType = nvcXMLPOSTData.Get("RecType") == null ? string.Empty : nvcXMLPOSTData.Get("RecType").ToString();

                    sNotes = new CMSHlp().GetCommentNotes(Convert.ToInt64(JMMMedVisitID), KPIHlp.CVI32(RecType));

                    if (!string.IsNullOrEmpty(sNotes))
                    {
                        nvcXMLResponseData.Add("Notes", sNotes);
                    }
                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
                #endregion
                else
                {
                    sDrug = nvcXMLPOSTData.Get("Drug") == null ? string.Empty : nvcXMLPOSTData.Get("Drug");
                    sDosage = nvcXMLPOSTData.Get("Dosage") == null ? string.Empty : nvcXMLPOSTData.Get("Dosage");
                    sPrescribedAmt = nvcXMLPOSTData.Get("PrescribedAmt") == null ? string.Empty : nvcXMLPOSTData.Get("PrescribedAmt");
                    sRefills = nvcXMLPOSTData.Get("Refills") == null ? string.Empty : nvcXMLPOSTData.Get("Refills");
                    sGenericAllowed = nvcXMLPOSTData.Get("GenericAllowed") == null ? string.Empty : nvcXMLPOSTData.Get("GenericAllowed");
                    sNotes = nvcXMLPOSTData.Get("Notes") == null ? string.Empty : nvcXMLPOSTData.Get("Notes");
                    sCurBalance = nvcXMLPOSTData.Get("CurBalance") == null ? string.Empty : nvcXMLPOSTData.Get("CurBalance");
                    sBookID = nvcXMLPOSTData.Get("BookId") == null ? string.Empty : nvcXMLPOSTData.Get("BookId");
                    sMode = nvcXMLPOSTData.Get("Mode") == null ? string.Empty : nvcXMLPOSTData.Get("Mode");
                    sPresID = nvcXMLPOSTData.Get("Prescriptionid") == null ? string.Empty : nvcXMLPOSTData.Get("Prescriptionid");
                    sVisitID = nvcXMLPOSTData.Get("MedVisitID") == null ? string.Empty : nvcXMLPOSTData.Get("MedVisitID");

                    JmmMedPrescribe objJmmPresc = new JmmMedPrescribe();
                    JmmMedPrescribeBL objJmmPrescBL = new JmmMedPrescribeBL();
                    objJmmPresc.Dosage = sDosage.ToString();
                    objJmmPresc.Drug = sDrug.ToString();
                    objJmmPresc.PrescribedAmt = KPIHlp.CVI32(sPrescribedAmt.ToString());
                    objJmmPresc.Refills = KPIHlp.CVI32(sRefills.ToString());
                    if (sGenericAllowed.ToString().Equals("true"))
                        objJmmPresc.IsGeneric = 1;
                    else
                        objJmmPresc.IsGeneric = 0;

                    objJmmPresc.CurQuantity = KPIHlp.CVI32(sCurBalance.ToString());
                    //need to change
                    if (!String.IsNullOrEmpty(sMode))
                    {
                        objJmmPresc.cMode = KPIHlp.CVC(sMode);
                    }
                    objJmmPresc.IsPersonalProp = 1;
                    //need to pass
                    objJmmPresc.JMBookingID = KPIHlp.CVI64(sBookID.ToString());
                    objJmmPresc.JurisID = GetPageJuris();

                    objJmmPresc.RefillBal = KPIHlp.CVI16(sRefills.ToString());
                    objJmmPresc.Times = 0;
                    //objJmmPresc.Times="";
                    objJmmPresc.PrescribeNotes = sNotes.ToString();
                    if (sMode.Equals("A"))
                    {
                        objJmmPresc.MedVisitID = KPIHlp.CVI64(sVisitID.ToString());
                        objJmmPresc.MedPrescribeID = KPICounter.GetCounterID(objJmmPresc.JurisID);
                        objJmmPrescBL.Insert(objJmmPresc);
                        nvcXMLResponseData.Add("PrescriptionId", objJmmPresc.MedPrescribeID.ToString());
                    }
                    else
                    {
                        objJmmPresc.MedPrescribeID = KPIHlp.CVI64(sPresID);
                        objJmmPrescBL.Update(objJmmPresc);
                        //get id from grd
                        nvcXMLResponseData.Add("PrescriptionId", objJmmPresc.MedPrescribeID.ToString());
                    }

                    Response.Write(BuildKPIXMLResponse(nvcXMLResponseData));
                    Response.End();
                }
            }
            catch (Exception objErr)
            {
                if (!objErr.Message.StartsWith("Thread was being aborted"))
                {
                    string sErrMsg = "Invalid XML Request String" + objErr.Message;
                    Response.Write(sErrMsg);
                    Response.End();
                    //return;
                }
            }
        }
    }
}

/****PNX*************

	#region Web Form Designer generated code

		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		protected void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);
		}

		#endregion Web Form Designer generated code

*************PNX****/