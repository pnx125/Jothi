namespace KPI.PhoenixWeb.Inmate.UserControls
{
    using Global.KPIWebControls;
    using Infragistics.Web.UI.GridControls;
    using KPI.Global;
    using KPI.Global.Helper;
    using KPI.Phoenix.Inmate;
    //using KPI.Phoenix.Global;

    using KPI.Phoenix.Object.Inmate;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Drawing;
    using System.Linq;
    using System.Web.UI.HtmlControls;



    /// <summary>
    ///		Summary description for usrMedicationHistorySupply.
    /// </summary>
    public partial class usrMedicationHistorySupply : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            //// Put user code to initialize the page here
            cmdAdd.Attributes.Add("onclick", "return fn_PrescriptionGridManip_Row();");
            cmdClear.Attributes.Add("onclick", "return fn_CancelEditPrescripRow();");
            btnDisposition.Attributes.Add("onclick", "return fn_Disposition();");
          
            KPIImageButton objDentistIbubble = ((KPI.Global.KPIWebControls.KPIImageButton)(lupPrimaryDoctor.FindControl("cmdIncOnAddr")));
            objDentistIbubble.Attributes.Add("onClick", "return fn_DentistEntry('HistorySupply');");
            ((BasePage)Page).AddClientOnLoadScript("fn_CancelEditPrescripRow();");

            
        }

   

        public void Inquiry(ref JMMMedicalHist objMedical)
        {
          
            try
            {
                LoadData(ref objMedical);
            }
            catch (Exception)
            {

                throw;
            }
        }

      
       

      


        public void ReadScr(ref JMMMedicalHist objJMMMedicalHist)
        {
            #region
            JMMMedPrescriptionList objJMMedPrescriptionList = new JMMMedPrescriptionList();
            for (int iCount = 0; iCount < grdPrescription.Rows.Count; iCount++)
            {
                if (grdPrescription.IsActiveRow(iCount))
                {
                    JMMMedPrescription objJMMedPrescription = new JMMMedPrescription();

                    objJMMedPrescription.JurisID = objJMMMedicalHist.JurisID != Int32.MinValue ? objJMMMedicalHist.JurisID : null;
                    objJMMedPrescription.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID.Value;
                    objJMMedPrescription.JMBookingID = objJMMMedicalHist.JMBookingID;
                    hdnBookingID.Value = objJMMMedicalHist.JMBookingID.Value.ToString();
                    if(grdPrescription.GetLong(iCount, "JMMedVisitID") > 0)
                    {
                        objJMMedPrescription.JMMedVisitID = grdPrescription.GetLong(iCount, "JMMedVisitID");
                    }
                    else
                    {
                        objJMMedPrescription.JMMedVisitID = null;
                    }
                   
                    long JMMedPrescriptionID = grdPrescription.GetLong(iCount, "KPIID");
                    if (JMMedPrescriptionID != long.MinValue && JMMedPrescriptionID > 0)
                    {
                        objJMMedPrescription.JMMedPrescriptionID = JMMedPrescriptionID;
                        objJMMedPrescription.MedicalPrescriptionNo = KPIHlp.CVI64(grdPrescription.Rows[iCount].Items.FindItemByKey("MedicalPrescriptionNo").Text);
                        objJMMedPrescription.cMode = 'C';
                    }
                    else
                    {
                        objJMMedPrescription.JMMedPrescriptionID = KPICounter.GetCounterID(objJMMedPrescription.JurisID.Value);
                        objJMMedPrescription.MedicalPrescriptionNo = Counter.GetCounterNo(objJMMedPrescription.JurisID.Value, CounterType.MedicalPrescriptionNo, Int64.MinValue);
                        objJMMedPrescription.cMode = 'A';
                    }




                    //missing prescribed date
                    if (grdPrescription.GetDateTime(iCount, "PrescribedDttm") != DateTime.MinValue)
                    {
                        objJMMedPrescription.PrescribedDttm = grdPrescription.GetDateTime(iCount, "PrescribedDttm");
                    }

                    objJMMedPrescription.PrescribingDoctorID = KPIHlp.CVI64(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribingDoctorID").Text);
                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Prescription").Text))
                    {
                        objJMMedPrescription.Prescription = grdPrescription.Rows[iCount].Items.FindItemByKey("Prescription").Text;
                    }
                    objJMMedPrescription.Drug = grdPrescription.Rows[iCount].Items.FindItemByKey("Drug").Text;
                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Dosage").Text))
                    {
                        objJMMedPrescription.Dosage = grdPrescription.Rows[iCount].Items.FindItemByKey("Dosage").Text;
                    }
                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text) != Int32.MinValue)
                    {
                        objJMMedPrescription.PrescribedAmt = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedAmt").Text);
                    }
                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedDuration").Text))
                    {
                        objJMMedPrescription.PrescribedDuration = grdPrescription.Rows[iCount].Items.FindItemByKey("PrescribedDuration").Text;
                    }
                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text) != Int32.MinValue)
                    {
                        objJMMedPrescription.Refills = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Refills").Text);
                    }
                    if (grdPrescription.Rows[iCount].Items.FindItemByKey("IsGeneric").Text == "1")
                    {
                        objJMMedPrescription.IsGeneric = 1;
                    }
                    else
                    {
                        objJMMedPrescription.IsGeneric = 0;
                    }
                    objJMMedPrescription.Times = 0;


                    if (grdPrescription.GetInt(iCount, "CurQuantity") > 0)
                    {
                        objJMMedPrescription.CurQuantity = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("CurQuantity").Text);
                        objJMMedPrescription.Balance = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("CurQuantity").Text);
                    }
                    else
                    {
                        objJMMedPrescription.CurQuantity = 0;
                        objJMMedPrescription.Balance = 0;
                    }


                    objJMMedPrescription.IsPersonalProp = 0;
                    if (grdPrescription.GetDateTime(iCount, "UseEndedDttmTemp") != DateTime.MinValue)
                    {
                        objJMMedPrescription.UseEndedDttm = grdPrescription.GetDateTime(iCount, "UseEndedDttmTemp");
                    }
                    //if (!string.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text) && KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text) != Int32.MinValue)
                    //{
                    //    objJMMedPrescription.Balance = KPIHlp.CVI32(grdPrescription.Rows[iCount].Items.FindItemByKey("Balance").Text);
                    //}
                    //objJMMedPrescription.MedicationType = null; // grdPrescription.Rows[iCount].Items.FindItemByKey("MedicationType").Text;

                    if (!String.IsNullOrWhiteSpace(grdPrescription.Rows[iCount].Items.FindItemByKey("Notes").Text))
                    {
                        objJMMedPrescription.PrescribeNotes = grdPrescription.Rows[iCount].Items.FindItemByKey("Notes").Text;
                    }

                    objJMMedPrescription.IsActiveSchedule = grdPrescription.Rows[iCount].Items.FindItemByKey("IsActiveSchedule").Text;

                    
                    objJMMedPrescriptionList.Add(objJMMedPrescription);
                }

            }
            objJMMMedicalHist.objJMMMedPrescriptionList = objJMMedPrescriptionList;
            #endregion
        }



        public void LoadData(ref JMMMedicalHist objJMMMedicalHist)
        {
            try
            {
                JMMMedPrescription objJMMedPrescription = null;

                if (objJMMMedicalHist != null)
                {
                    objJMMedPrescription = new JMMMedPrescription();
                    if (objJMMMedicalHist.JMMedicalHistID.HasValue)
                    {
                        objJMMedPrescription.JMMedicalHistID = objJMMMedicalHist.JMMedicalHistID.Value;
                    }
                    objJMMedPrescription.JMBookingID = objJMMMedicalHist.JMBookingID.Value;
                    objJMMedPrescription.JurisID = objJMMMedicalHist.JurisID.Value;

                    if (chkInactive.Checked)
                    {
                        objJMMedPrescription.IsActiveSchedule = "1";
                    }
                    else
                    {
                        objJMMedPrescription.IsActiveSchedule = string.Empty;

                    }
                    objJMMedPrescription.ScreenID = ((HtmlInputHidden)(((BasePage)this.Page).FindControl("hdnScreenId"))).Value;
                    DataSet objDS = BindMedicalPrescriptionGrid(ref objJMMedPrescription);
                }
            }
            catch (Exception)
            {

                throw;
            }

        
          
        }

        private DataSet BindMedicalPrescriptionGrid(ref JMMMedPrescription objJMMedPrescription)
        {
            DataSet objDS = null;
            try
            {
             
                objDS = new JMMMedPrescriptionBL().GetPrescriptionDetails(ref objJMMedPrescription);
                DataRelation objDR = new DataRelation("MasterDetails1", objDS.Tables[0].Columns["JMMedPrescriptionID"], objDS.Tables[1].Columns["JMMedPrescriptionID"], true);
                objDS.Relations.Add(objDR);
                grdPrescription.GridView.GroupedRows.Clear();
                grdPrescription.Rows.Clear();
                grdPrescription.GridView.Rows.Clear();
                grdPrescription.GridView.ClearDataSource();
                grdPrescription.DataSource = objDS;
                grdPrescription.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
            return objDS;
        }

        protected void grdPrescription_InitializeRow(object sender, RowEventArgs e)
        {
            try
            {
                var iRow = e.Row.Index;

                switch (((ContainerGridRecord)e.Row).Level)
                {
                    case 0:
                        if (e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text != null && !String.IsNullOrEmpty(e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text) && KPIHlp.CVI64(e.Row.Items.FindItemByKey("JMMedPrescriptionID").Text) > 0)
                        {
                            e.Row.Items.FindItemByKey("SupplyStatus").CssClass = "NotificationRules";
                            e.Row.Items.FindItemByKey("Schedule").CssClass = "Schedule";

                        }

                        if (e.Row.Items.FindItemByKey("PrescribeNotes").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("PrescribeNotes").Text) && e.Row.Items.FindItemByKey("PrescribeNotes").Text == "1")
                        {
                            e.Row.Items.FindItemByKey("Cmts").CssClass = "Notes";
                        }

                        if ((e.Row.Items.FindItemByKey("PrescribedAmt").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("PrescribedAmt").Text)) || (e.Row.Items.FindItemByKey("Duration").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("Duration").Text)))
                        {
                            e.Row.Items.FindItemByKey("DurationYrs").Text = e.Row.Items.FindItemByKey("PrescribedAmt").Text + ' ' + e.Row.Items.FindItemByKey("Duration").Text;
                        }
                        if ((e.Row.Items.FindItemByKey("UseEndedDttm").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("UseEndedDttm").Text)))
                        {
                            e.Row.CssClass = "grdGColor";
                        }else if (String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("JMPrescriptionOrderID").Text))
                        {
                            e.Row.Items.FindItemByKey("CurQuantity").Text = string.Empty;
                        }
                        else if (e.Row.Items.FindItemByKey("CurQuantity").Text != null && KPIHlp.CVI32(e.Row.Items.FindItemByKey("CurQuantity").Text) <= 5)
                        {
                            e.Row.CssClass = "grdRedColor";
                        }
                        e.Row.Items.FindItemByKey("UseEndedDttmTemp").Text = e.Row.Items.FindItemByKey("UseEndedDttm").Text;
                        break;
                    case 1:
                        if (e.Row.Items.FindItemByKey("OrderedNotes").Text != null && !String.IsNullOrWhiteSpace(e.Row.Items.FindItemByKey("OrderedNotes").Text) && e.Row.Items.FindItemByKey("OrderedNotes").Text == "1")
                        {
                            e.Row.Items.FindItemByKey("Cmts").CssClass = "Notes";
                        }

                        e.Row.Items.FindItemByKey("QtyBalance").Text = e.Row.Items.FindItemByKey("QtyBalance").Text + " " + e.Row.Items.FindItemByKey("QuantityDesc").Text;

                        break;
                }
            }
            catch (Exception)
            {

                throw;
            }


        }


     
    }
}