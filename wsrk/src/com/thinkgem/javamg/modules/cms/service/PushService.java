/**
 * 
 */
package com.thinkgem.javamg.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.ClientConfig;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.Notification;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.cms.dao.PushDao;
import com.thinkgem.javamg.modules.cms.entity.Push;

/**
 * 推送Service
 * 
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class PushService extends CrudService<PushDao, Push> {

	@Transactional(readOnly = false)
	public Page<Push> findPage(Page<Push> page, Push push, boolean isDataScopeFilter) {
		return super.findPage(page, push);
	}

	@Override
	@Transactional(readOnly = false)
	public void save(Push push) {
		push.setStatus(0);
		if (org.apache.commons.lang3.StringUtils.isBlank(push.getId())){
			push.preInsert();
			dao.insert(push);
		}else{
			push.preUpdate();
			dao.update(push);
		}
		ClientConfig clientConfig = ClientConfig.getInstance();
        JPushClient jpushClient = new JPushClient("8810b8e4ce11854fbc77c11a", "1e8156c2c4a545d48a4ec281", null, clientConfig);
        
        // For push, all you need do is to build PushPayload object.
        PushPayload payload = buildPushObject_ios_audienceMore_messageWithExtras(push.getContent());;
        if(push.getType().equals("alert")){
        	payload = buildPushObject_all_all_alert(push.getContent());
        }else{
        	payload = buildPushObject_ios_audienceMore_messageWithExtras(push.getContent());
        }
        try {
            PushResult result = jpushClient.sendPush(payload);
            if(result.isResultOK()){
            	push.setStatus(1);
            	push.preUpdate();
    			dao.insert(push);
            }else{
            	push.setStatus(2);
            	push.preUpdate();
    			dao.update(push);
            }
        } catch (APIConnectionException e) {
        	push.setStatus(2);
        	push.preUpdate();
			dao.update(push);
        } catch (APIRequestException e) {
        	push.setStatus(2);
        	push.preUpdate();
			dao.update(push);
        }
	}
	
	public static PushPayload buildPushObject_all_all_alert(String content) {
	    return PushPayload.alertAll(content);
	}
	
	public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras(String content) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.android_ios())
                .setAudience(Audience.all())
                .setMessage(Message.newBuilder()
                        .setMsgContent(content)
                        .addExtra("from", "JPush")
                        .build())
                .build();
    }
	
	@Transactional(readOnly = false)
	public void delete(Push push, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		//Article article = dao.get(id);
		//article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		//dao.insert(article);
		super.delete(push);
	}
	
	/**
	 * 更新索引
	 */
	public void createIndex(){
		//dao.createIndex();
	}
}
