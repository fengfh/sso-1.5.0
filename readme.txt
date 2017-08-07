change log

===1.4.0====
1、登录、注销日志，增加主机名
2、集群时的Ticket记录主机名
3、修复CasTicketGrantingTicket.grantService的BUG。当一个多个客户端用同一个APP_ID时，会出现问题

===1.4.1===
1、二次登录，自动注销。 修改casLoginFormViewHandler ，增加p:centralAuthenticationService-ref="centralAuthenticationService"

===1.5.0===
1、Session标识未更新和防钓鱼的问题
	修改/WEB-INF/sso-core/sso-protocol.xml，增加属性
	    <bean id="openIdHandler" class="bingo.sso.server.cas.openid.CasOpenIdHandler"
          p:associationRegistry-ref="casAssociationRegistry"
          p:nonceRegistry-ref="nonceRegistry"
          p:gatewayAssociationRegistry-ref="casAssociationRegistry" 
          p:ssoClientUrls-ref="ssoClientUrls" /> 
          
     修改sso-deploy.xml，增加  ssoClientUrls配置
        <!-- 防钓鱼的问题 -->
		<util:list id="ssoClientUrls">
	        <value>http://localhost:8080/sso_app/openid</value>
	        <value>http://127.0.0.1:8080/sso_app/openid</value>
		</util:list>