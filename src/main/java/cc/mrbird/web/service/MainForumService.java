package cc.mrbird.web.service;

import cc.mrbird.common.domain.QueryRequest;
import cc.mrbird.common.service.IService;
import cc.mrbird.web.domain.MainForum;

import java.util.List;

public interface MainForumService extends IService<MainForum> {
    /**
     * 分页查询前端分类列表
     *
     * @param mainForum
     * @param request
     * @return
     */
    public List<MainForum> findMainForumByPage(MainForum mainForum, QueryRequest request);

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
     * @param ids
     * @return
     */
    public void deleteMainForums(String ids);

    /**
     * 修改分类信息
     * @param mainForum
     * @return
     */
    public void updateMainForum(MainForum mainForum);

}
