package cc.mrbird.web.dao;

import cc.mrbird.web.domain.MainForum;

import java.util.List;

public interface MainForumMapper {
   /**
     * 分页查询前端分类列表
     *
     * @param mainForum
     * @return
     */
    public List<MainForum> findMainForumByPage(MainForum mainForum);

    /**
     * 根据id查询分类信息
     *
     * @param id
     * @return
     */
    public MainForum findById(Integer id);
    /**
     * 新增分类信息
     * @param mainForum
     * @return
     */
    public void addMainForum(MainForum mainForum);

    /**
     * 删除分类信息
     * @param id
     * @return
     */
    public void deleteMainForum(Integer id);

    /**
     * 修改分类信息
     * @param mainForum
     * @return
     */
    public void updateMainForum(MainForum mainForum);
}