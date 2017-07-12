using System;
using System;
using System.Data;
using OnLineExam.DataAccessLayer;

namespace OnLineExam.CommonComponent
{
    /// <summary>
    /// 一个通用的树状菜单类
    /// </summary>
    public class Tree
    {
        private string _treeHtml;
        private DataTable _dataTable;

        private string _title = "";


        public Tree(string Title)
        {
            _title = Title;
        }

        /// <summary>
        /// 根据DataTable对象，生成一棵树
        /// </summary>
        /// <param name="dataTable">树中节点的数据</param>
        /// <returns>树的HTML代码</returns>
        public string CreateTree(DataTable dataTable)
        {
            this._dataTable = dataTable;
            string sMenu = "<div class='service-menu'>" +
                            "  <input class='menu-code-index' type='hidden' value='c849' />" +
                            "  <h2 class='menu-title'>"+ _title +"</h2>";

            DataTable childNodes = GetChilds(0);	//获取根节点的所有孩子

            foreach (DataRow dr in childNodes.Rows)
            {
                int childId = Convert.ToInt32(dr["nodeId"]);
                sMenu += "<strong class='menu-p'><i class='menu-i'></i>" + dr["Text"] + "</strong>";
                sMenu += CreateSubTree(childId);//递归
            }
           
            sMenu += "</div>";

            //this.CreateSubTree(0);
            return sMenu;
        }

        /// <summary>
        /// 获取父节点编号为parentId的所有节点，并用DataTable返回
        /// </summary>
        /// <param name="parentId">父节点编号</param>
        /// <returns>DataTable形式的所有孩子节点数据</returns>
        private DataTable GetChilds(int parentId)
        {
            DataTable childNodes = new DataTable();
            childNodes = this._dataTable.Clone();

            foreach (DataRow dr in this._dataTable.Rows)
            {
                if (Convert.ToInt32(dr["ParentId"]) == parentId)
                {
                    childNodes.ImportRow(dr);
                }
            }

            return childNodes;
        }

        /// <summary>
        /// 判断编号为nodeId的节点是否为叶子节点
        /// </summary>
        /// <param name="nodeId">待判断的节点编号</param>
        /// <returns>是叶子节点：返回true；否则：返回false</returns>
        private bool IsLeaf(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["ParentId"]) == nodeId)
                    return false;
            return true;
        }

        /// <summary>
        /// 得到编号为nodeId的节点的父节点编号
        /// </summary>
        /// <param name="nodeId">节点编号</param>
        /// <returns>父节点编号</returns>
        private int GetParent(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["NodeId"]) == nodeId)
                    return Convert.ToInt32(dr["ParentId"]);
            return -1;

        }

        /// <summary>
        /// 得到编号为nodeId的节点的级别，根节点为0
        /// </summary>
        /// <param name="nodeId">待计算的巨额电编号</param>
        /// <returns>节点的级别，根节点为0</returns>
        private int GetLevel(int nodeId)
        {
            int parentId = GetParent(nodeId);
            if (parentId == 0) return 1;
            else
                return GetLevel(parentId) + 1;	//递归
        }

        /// <summary>
        /// 递归生成根编号为nodeId的树
        /// </summary>
        /// <param name="nodeId">所要生成子树的根节点</param>
        private string CreateSubTree(int nodeId)
        {
            string sMenu = "";
            DataTable childNodes = this.GetChilds(nodeId);	//获取根节点的所有孩子

            //循环生成根节点的所有孩子对应的HTML
            int childId = 0;
            sMenu += "<div class='menu-c'><ul>";
            foreach (DataRow dr in childNodes.Rows)
            {
                childId = Convert.ToInt32(dr["nodeId"]);

                sMenu += "<li><a data-service-index='c500' href=" + dr["Url"] + ">" + dr["Text"] + "</a></li>";

            }

            sMenu += " </ul></div>";
            return sMenu;
        }
    }
}