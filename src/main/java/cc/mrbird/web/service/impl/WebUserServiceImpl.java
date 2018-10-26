package cc.mrbird.web.service.impl;

import cc.mrbird.common.domain.QueryRequest;
import cc.mrbird.common.service.impl.BaseService;
import cc.mrbird.system.dao.UserMapper;
import cc.mrbird.system.domain.User;
import cc.mrbird.web.dao.WebUserMapper;
import cc.mrbird.web.domain.WebUser;
import cc.mrbird.web.service.WebUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 *客户端用户服务层
 * Created by cui on 2018/10/25.
 */

@Service("webUserService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class WebUserServiceImpl extends BaseService<WebUser>  implements WebUserService {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private WebUserMapper webUserMapper;

    @Override
    public List<WebUser> findWebUserByPage(WebUser user, QueryRequest request) {
        try {
            return this.webUserMapper.findWebUserByPage(user);
        } catch (Exception e) {
            log.error("error", e);
            return new ArrayList<>();
        }
    }
}
