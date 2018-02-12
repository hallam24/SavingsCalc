using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SavingsCalculator
{
    public partial class _Default : Page
    {
        double mEarn;
        double mEarnRaw;
        double taxable;
        double tax;
        double personalAllow = 11500;
        double rent;
        double food;
        double utilities;
        double living;
        double transport;
        double hobbies;
        bool beforeTax;
        //double hotelNights;
        //double hotelPerNight;
        //double hotel;
        //double meal;
        //double activities;
        //double spendingMoney;
        //double misc;
        //double transportation;



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            lblChartType.Visible = true;
            DropDownList1.Visible = true;
            drawChart(getChartType());

            

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedValue)
            {
                case "pie":
                    drawChart("pie");
                    break;
                case "doughnut":
                    drawChart("doughnut");
                    break;
                case "column":
                    drawChart("column");
                    break;
                case "bar":
                    drawChart("bar");
                    break;
            }
        }

        private void drawChart(string chartType)
        {
            

            if(BTaxBtn.Checked == false)
            {
                mEarn = getData(tbMEarn);
                tax = 0;
            }else
            {
                mEarnRaw = getData(tbMEarn);
                mEarnRaw *= 12;
                if(mEarnRaw < 11500)
                {
                    mEarn = getData(tbMEarn);
                    tax = 0;
                }
                else if(mEarnRaw > personalAllow && mEarnRaw < 45001)
                {
                    taxable = mEarnRaw - personalAllow;
                    tax = taxable * 0.2;
                    mEarn = mEarnRaw - tax;
                    mEarn = Math.Round(mEarn / 12);
                    tax = Math.Round(tax / 12);

                }
                else if (mEarnRaw > 45000 && mEarnRaw < 100000)
                {

                    taxable = mEarnRaw - 45000;
                    tax += taxable * 0.4;
                    
                    taxable = mEarnRaw - (mEarnRaw - 45000); // this just equals 45000
                    taxable -= personalAllow;

                    tax += taxable * 0.2; 

                    mEarn = mEarnRaw - tax; 
                    mEarn = Math.Round(mEarn / 12);
                    tax = Math.Round(tax / 12);

                }
                else if (mEarnRaw > 100000 && mEarnRaw < 150001)
                {

                    taxable = mEarnRaw - 33500;
                    tax += taxable * 0.4;

                    taxable = 33500;
                    taxable -= Math.Max(0,(personalAllow - ((mEarnRaw - 100000) /2)));
                    tax += taxable * 0.2; 

                    mEarn = mEarnRaw - tax;
                    mEarn = Math.Round(mEarn / 12);
                    tax = Math.Round(tax / 12);
                }
                else
                {
                    taxable = mEarnRaw - 150000;
                    tax += taxable * 0.45;

                    taxable = 116500;
                    tax += taxable * 0.4;

                    taxable = 33500;
                    taxable -= Math.Max(0, (personalAllow - ((mEarnRaw - 100000) / 2)));
                    tax += taxable * 0.2;

                    mEarn = mEarnRaw - tax;
                    mEarn = Math.Round(mEarn / 12);
                    tax = Math.Round(tax / 12);
                }
            }

            rent = getData(tbRent);
            food = getData(tbFood);
            utilities = getData(tbUtil);
            transport = getData(tbTransport);
            hobbies = getData(tbHobbies);

            living = rent + food + utilities;

            double total = living + transport + hobbies;
            double leftover = mEarn - total;

            if(leftover > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "draw", "draw('" + chartType + "','" + mEarn + "','" + tax + "','" + living + "','" + transport + "','" +
                                               hobbies + "','" + total + "','" + leftover + "');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "drawDebt", "drawDebt('" + chartType + "','" + mEarn + "','" + tax + "','" + living + "','" + transport + "','" +
                                               hobbies + "','" + total + "','" + leftover + "');", true);
            }
           
        }

        private double getData(TextBox txtBoxValue)
        {
            if (!string.IsNullOrWhiteSpace(txtBoxValue.Text))
            {
                return double.Parse(txtBoxValue.Text);
            }
            else
            {
                txtBoxValue.Text = "0";
                return 0;
            }
        }

        private string getChartType()
        {
            return DropDownList1.SelectedValue;
        }
    }

}