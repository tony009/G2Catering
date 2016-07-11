#import <Foundation/Foundation.h>


@interface CmEmployee : NSObject
	
	@property(nonatomic,copy)NSString *defaultId ; //用户ID 唯一标识
    @property(nonatomic,copy)NSString * salt ;  // 0(修改个人信息） 1（修改密码） 2（忘记密码）
    @property(nonatomic,copy)NSString * updateBy ;
    @property(nonatomic,copy)NSString * resProvince ;
    @property(nonatomic,copy)NSString * adrCity ;

    @property(nonatomic,copy)NSString * loginUsername ; //用户名
    @property(nonatomic,copy)NSString * loginPassword ; //密码
    @property(nonatomic,copy)NSString * name ; //昵称
    @property(nonatomic,copy)NSString * mobile ;  //手机

    @property(nonatomic,copy)NSString * jobPic ; // 头像

    @property(nonatomic,copy)NSString * residenceAdr ;

    @property(nonatomic,copy)NSString * jobStatus ; // 状态（0,锁定，1正常)
    @property(nonatomic,copy)NSString * emerContact ; //收货人姓名
    @property(nonatomic,copy)NSString * address ; //收货地址
    @property(nonatomic,copy)NSString * emerConTel ; //收货人电话

    @property(nonatomic,copy)NSString * createBy ;

    @property(nonatomic,copy)NSString * plainPassword ; //新密码
    @property(nonatomic,copy)NSString * adrProvince ;
    /**
     * 组织ID
     **/
    @property(nonatomic,copy)NSString * storeId ;
    @property(nonatomic,copy)NSString * sysdataType ;
    /**
     * 对应 Gender
     **/
    @property(nonatomic,copy)NSString * gender ;

    @property(nonatomic,copy)NSString * idCard ;
    @property(nonatomic,copy)NSString * barPath ;
    @property(nonatomic,copy)NSString * empStatus ;
    @property(nonatomic,copy)NSString * restId ;
    @property(nonatomic,copy)NSString * isSyn ;
    /**
     * 判别是否为当前餐厅人员标识符
     **/
    @property(nonatomic,copy)NSString * belongRest ;
    @property(nonatomic,assign)NSInteger  synVersion ;
    @property(nonatomic,copy)NSString * resCity ;
    /**
     * post授权码
     **/
    @property(nonatomic,copy)NSString * authorizationMake ;
    @property(nonatomic,assign)NSInteger  version ;

    /**
     * 授权码（登录创建餐厅页面）
     **/
    @property(nonatomic,copy)NSString * authorizationCode ; //验证码
    @property(nonatomic,copy)NSString * empNum ;
    @property(nonatomic,copy)NSDate * updateTime ;
    @property(nonatomic,copy)NSDate * createTime ;


-(instancetype)initWithMobile:(NSString *)mobile
                     password:(NSString *)password;



//用于 修改用户信息
-(instancetype)initWithDefaultId:(NSString *)defaultId
                            Name:(NSString *)name
                     emerContact:(NSString *)emerContact
                      emerConTel:(NSString *)emerConTel
                         address:(NSString *)address
                        loginUsername:(NSString *)loginUsername;

//用于 修改密码
-(instancetype)initWithDefaultId:(NSString *)defaultId
                     oldPassword:(NSString *)oldPassword
                     newPassword:(NSString *)newPassword;

//用于 忘记密码
-(instancetype)initWithDefaultId:(NSString *)defaultId
                          mobile:(NSString *)mobile
               authorizationCode:(NSString *)authorizationCode
                        password:(NSString *)password

;
@end