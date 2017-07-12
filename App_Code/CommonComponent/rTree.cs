using System;
using System.Data;
using OnLineExam.DataAccessLayer;

namespace OnLineExam.CommonComponent
{
    /// <summary>
    /// һ��ͨ�õ���״�˵���
    /// </summary>
    public class Tree2
    {
        private string _treeHtml;
        private DataTable _dataTable;

        private string _title = "";


        public Tree2(string Title)
        {
            _title = Title;
        }

        /// <summary>
        /// ����DataTable��������һ����
        /// </summary>
        /// <param name="dataTable">���нڵ������</param>
        /// <returns>����HTML����</returns>
        public string CreateTree2(DataTable dataTable)
        {
            this._dataTable = dataTable;
            string sMenu = "<div class='service-menu2'>" +
                            "  <input class='menu-code-index' type='hidden' value='c849' />" +
                            "  <h2 class='menu-title2'>"+ _title +"</h2>";

            DataTable childNodes = GetChilds2(0);	//��ȡ���ڵ�����к���

            foreach (DataRow dr in childNodes.Rows)
            {
                int childId = Convert.ToInt32(dr["nodeId"]);
                sMenu += "<strong class='menu-p2'><i class='menu-i2'></i>" + dr["Text"] + "</strong>";
                sMenu += CreateSubTree2(childId);//�ݹ�
            }
           
            sMenu += "</div>";

            //this.CreateSubTree(0);
            return sMenu;
        }

        /// <summary>
        /// ��ȡ���ڵ���ΪparentId�����нڵ㣬����DataTable����
        /// </summary>
        /// <param name="parentId">���ڵ���</param>
        /// <returns>DataTable��ʽ�����к��ӽڵ�����</returns>
        private DataTable GetChilds2(int parentId)
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
        /// �жϱ��ΪnodeId�Ľڵ��Ƿ�ΪҶ�ӽڵ�
        /// </summary>
        /// <param name="nodeId">���жϵĽڵ���</param>
        /// <returns>��Ҷ�ӽڵ㣺����true�����򣺷���false</returns>
        private bool IsLeaf2(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["ParentId"]) == nodeId)
                    return false;
            return true;
        }

        /// <summary>
        /// �õ����ΪnodeId�Ľڵ�ĸ��ڵ���
        /// </summary>
        /// <param name="nodeId">�ڵ���</param>
        /// <returns>���ڵ���</returns>
        private int GetParent2(int nodeId)
        {
            foreach (DataRow dr in this._dataTable.Rows)
                if (Convert.ToInt32(dr["NodeId"]) == nodeId)
                    return Convert.ToInt32(dr["ParentId"]);
            return -1;

        }

        /// <summary>
        /// �õ����ΪnodeId�Ľڵ�ļ��𣬸��ڵ�Ϊ0
        /// </summary>
        /// <param name="nodeId">������ľ޶����</param>
        /// <returns>�ڵ�ļ��𣬸��ڵ�Ϊ0</returns>
        private int GetLevel2(int nodeId)
        {
            int parentId = GetParent2(nodeId);
            if (parentId == 0) return 1;
            else
                return GetLevel2(parentId) + 1;	//�ݹ�
        }

        /// <summary>
        /// �ݹ����ɸ����ΪnodeId����
        /// </summary>
        /// <param name="nodeId">��Ҫ���������ĸ��ڵ�</param>
        private string CreateSubTree2(int nodeId)
        {
            string sMenu = "";
            DataTable childNodes = this.GetChilds2(nodeId);	//��ȡ���ڵ�����к���

            //ѭ�����ɸ��ڵ�����к��Ӷ�Ӧ��HTML
            int childId = 0;
            sMenu += "<div class='menu-c2'><ul>";
            foreach (DataRow dr in childNodes.Rows)
            {
                childId = Convert.ToInt32(dr["nodeId"]);

                sMenu += "<li><a data-service-index='c500' href=" + dr["Url"] + ">" +dr["Text"] + "</a></li>";

            }

            sMenu += " </ul></div>";
            return sMenu;
        }
    }
}