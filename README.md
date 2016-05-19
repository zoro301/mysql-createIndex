#mysql create index

1.在本地数据库执行需要使用有用户名的sql脚本时，可能会出现如下异常(root替换为你当前使用的用户名):
ERROR 1449(HY000):The user specified as a definer('root'@'%') does not exist

解决：为该账户赋予全部操作权限（具体权限依据实际情况决定）
	  grant all privileges on *.* to root@"%" identified by ".";

2.调用存储过程，参数含义如下：
call create_index_if_not_exists(table_name,index_name,index_type,filed_list);

index_type是INDEX,UNIQUE等关键字


例：

call create_index_if_not_exists('role','roleId','UNIQUE','roleId');

call create_index_if_not_exists('user','userId','INDEX','userId');

call create_index_if_not_exists('roleuserrelation','role_user','INDEX','roleId,userId');

