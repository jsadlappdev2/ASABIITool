using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

using OnLineExam.DataAccessLayer;
using OnLineExam.DataAccessHelper;

namespace OnLineExam.BusinessLogicLayer
{    
    public class Department
    {
        #region 私有成员

        private int _departmentId;			//部门ID
        private string _departmentName;		//部门名       

        #endregion 私有成员

        #region 属性

        public int DepartmentId
        {
            set
            {
                this._departmentId = value;
            }
            get
            {
                return this._departmentId;
            }
        }
        public string DepartmentName
        {
            set
            {
                this._departmentName = value;
            }
            get
            {
                return this._departmentName;
            }
        }
   
        #endregion 属性

        #region 方法

        /// <summary>
        /// 根据参数departmentId，获取部门详细信息
        /// </summary>
        /// <param name="topicID">部门ID</param>
        public bool LoadData(int DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);                  //用户编号            

            DataSet ds = DB.GetDataSet("Proc_DepartmentDetail", Params);
            ds.CaseSensitive = false;
            DataRow DR;
            if (ds.Tables[0].Rows.Count > 0)
            {
                DR = ds.Tables[0].Rows[0];
                this._departmentId = GetSafeData.ValidateDataRow_N(DR, "DepartmentId");
                this._departmentName = GetSafeData.ValidateDataRow_S(DR, "DepartmentName");

                return true;
            }
            else
            {
                return false;
            }
        }
        public bool CheckDepartment(int XDepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, XDepartmentId);                

            SqlDataReader DR = DB.RunProcGetReader("Proc_DepartmentDetail", Params);
            if (!DR.Read())
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);             
            Params[1] = DB.MakeInParam("@DepartmentName", SqlDbType.VarChar, 50, DepartmentName);         
           

            int Count = -1;
            Count = DB.RunProc("Proc_DepartmentAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public bool UpdateByProc(string DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);
            Params[1] = DB.MakeInParam("@DepartmentName", SqlDbType.VarChar, 50, DepartmentName);            
           

            int Count = -1;
            Count = DB.RunProc("Proc_DepartmentModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public bool DeleteByProc(string DepartmentId)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@DepartmentId", SqlDbType.Int, 4, DepartmentId);               //用户编号          

            int Count = -1;
            Count = DB.RunProc("Proc_DepartmentDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        public DataSet QueryDepartment()
        {
            DataBase DB = new DataBase();
            return DB.GetDataSet("Proc_DepartmentList");
        }
       
        public static DataTable Query(Hashtable queryItems)
        {
            string where = SQLString.GetConditionClause(queryItems);
            string sql = "Select * From [Department]" + where;
            DataBase db = new DataBase();
            return db.GetDataTable(sql);
        }
       
        #endregion 方法
    }
}
