using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using OnLineExam.DataAccessLayer;
using OnLineExam.DataAccessHelper;


namespace OnLineExam.BusinessLogicLayer
{
    //用户类
    public class Paper
    {
        #region 私有成员
        private int _paperID;                                               //试卷编号
        private int _courseID;                                              //科目编号 
        private string _paperName;                                          //试卷名称  
        private byte _paperState;                                           //试卷状态
        private string _type;
        private string _userid;
        private string _state;   

        #endregion 私有成员

        #region 属性
      
        public int PaperID
        {
            set
            {
                this._paperID = value;
            }
            get
            {
                return this._paperID;
            }
        }
        public int CourseID
        {
            set
            {
                this._courseID = value;
            }
            get
            {
                return this._courseID;
            }
        }
        public string PaperName
        {
            set
            {
                this._paperName = value;
            }
            get
            {
                return this._paperName;
            }
        }        
        public byte PaperState
        {
            set
            {
                this._paperState = value;
            }
            get
            {
                return this._paperState;
            }
        }
        public string Type
        {
            set
            {
                this._type = value;
            }
            get
            {
                return this._type;
            }
        }
        public string UserID
        {
            set
            {
                this._userid = value;
            }
            get
            {
                return this._userid;
            }
        }
        public string state
        {
            set
            {
                this._state = value;
            }
            get
            {
                return this._state;
            }
        }
        
        #endregion 属性

        #region 方法

        //向Paper表中添加试卷信息(采用存储过程)
        //输出：
        //      插入成功：返回True；
        //      插入失败：返回False；
        public bool InsertByProc()
        {
            SqlParameter[] Params = new SqlParameter[3];
            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@CourseID", SqlDbType.Int, 4, CourseID);               //科目编号
            Params[1] = DB.MakeInParam("@PaperName", SqlDbType.VarChar, 200, PaperName);       //试卷名称            
            Params[2] = DB.MakeInParam("@PaperState", SqlDbType.Bit,1, PaperState);            //试卷状态            

            int Count = -1;
            Count = DB.RunProc("Proc_PaperAdd", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //更新试卷信息
        public bool UpdateByProc(int PID)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, PID);                      //试卷编号                       
            Params[1] = DB.MakeInParam("@PaperState", SqlDbType.Bit, 1, PaperState);            //试卷状态

            int Count = -1;
            Count = DB.RunProc("Proc_PaperModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //更新试卷是否评阅的状态
        public bool UpdateByProc(string XUserID,int XPaperID,string Xstate)
        {
            SqlParameter[] Params = new SqlParameter[3];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, XUserID);                                        
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, XPaperID);
            Params[2] = DB.MakeInParam("@state", SqlDbType.VarChar, 50,Xstate);   

            int Count = -1;
            Count = DB.RunProc("Proc_UserAnswerStateModify", Params);
            if (Count > 0)
                return true;
            else return false;
        }

        //删除题目
        //输入：
        //      TID - 题目编号；
        //输出：
        //      删除成功：返回True；
        //      删除失败：返回False；
        public bool DeleteByProc(int PID)
        {
            SqlParameter[] Params = new SqlParameter[1];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@ID", SqlDbType.Int, 4, PID);               //题目编号          

            int Count = -1;
            Count = DB.RunProc("Proc_PaperDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }
        //     删除某位用户的试卷
        public bool DeleteByProc(string userid,int paperid)
        {
            SqlParameter[] Params = new SqlParameter[2];

            DataBase DB = new DataBase();

            Params[0] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, userid);               //用户ＩＤ          
            Params[1] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperid);               //试卷ＩＤ 

            int Count = -1;
            Count = DB.RunProc("Proc_UserPaperDelete", Params);
            if (Count > 0)
                return true;
            else return false;
        }
     
        //查询所用试卷
        //不需要参数
        public DataSet QueryAllPaper()
        {
            DataBase DB = new DataBase();
            return DB.GetDataSet("Proc_PaperList");
        }

        //查询所用可用试卷
        //不需要参数
        public DataSet QueryPaper()
        {
            DataBase DB = new DataBase();
            SqlParameter[] Params = new SqlParameter[1];
            Params[0] = DB.MakeInParam("@PaperState", SqlDbType.Bit,1,  "true");               //题目编号   
            return DB.GetDataSet("Proc_PaperUseList",Params);
        }
        //查询所有用户考试的试卷
        public DataSet QueryUserPaperList()
        {
            DataBase DB = new DataBase();
            return DB.GetDataSet("Proc_UserPaperList");
        }
        //查询某个用户考试的试卷
        public DataSet QueryUserPaper(string type,string userid)
        {
            DataBase DB = new DataBase();
            SqlParameter[] Params = new SqlParameter[2];
            //Params[0] = DB.MakeInParam("@PaperID", SqlDbType.Int, 4, paperid);               //试卷编号
            Params[0] = DB.MakeInParam("@Type", SqlDbType.VarChar, 10, type);            //题目类型   
            Params[1] = DB.MakeInParam("@UserID", SqlDbType.VarChar, 50, userid);            //用户ID 

            return DB.GetDataSet("Proc_UserAnswer", Params);
        }       
        #endregion 方法
    }
}