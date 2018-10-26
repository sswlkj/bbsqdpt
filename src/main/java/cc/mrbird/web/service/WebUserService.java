package cc.mrbird.web.service;

import cc.mrbird.common.domain.QueryRequest;
import cc.mrbird.common.service.IService;
import cc.mrbird.system.domain.User;
import cc.mrbird.web.domain.WebUser;
import org.springframework.cache.annotation.CacheConfig;

import java.util.List;

/**
 * Created by cui on 2018/10/25.
 */
@CacheConfig(cacheNames = "WebUserService")
public interface WebUserService extends IService<WebUser> {
    /**
     * 分页查询前端用户列表
     * @param user
     * @param request
     * @return
     */
    public List<WebUser>  findWebUserByPage( WebUser user,QueryRequest request);
}
