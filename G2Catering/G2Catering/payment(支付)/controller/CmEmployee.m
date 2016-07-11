#import "CmEmployee.h"

@implementation CmEmployee
	
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
        //
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}


-(instancetype)initWithDefaultId:(NSString *)defaultId
                            Name:(NSString *)name
                     emerContact:(NSString *)emerContact
                      emerConTel:(NSString *)emerConTel
                         address:(NSString *)address
                       loginUsername:(NSString *)loginUsername{
    
    if ((self = [super init])!=nil) {
        _defaultId = defaultId;
        _name = name;
        _emerContact = emerContact;
        _emerConTel = emerConTel;
        _address = address;
        _loginUsername = loginUsername;
        
    }
    return self;
    
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_defaultId forKey:@"_defaultId"];
    [aCoder encodeObject:_loginUsername forKey:@"_loginUsername"];
    [aCoder encodeObject:_loginPassword forKey:@"_loginPassword"];
    [aCoder encodeObject:_name forKey:@"_name"];
    [aCoder encodeObject:_mobile forKey:@"_mobile"];
    [aCoder encodeObject:_jobPic forKey:@"_jobPic"];
    [aCoder encodeObject:_jobStatus forKey:@"_jobStatus"];
    [aCoder encodeObject:_emerContact forKey:@"_emerContact"];
    [aCoder encodeObject:_address forKey:@"_address"];
    [aCoder encodeObject:_emerConTel forKey:@"_emerConTel"];
    [aCoder encodeObject:_restId forKey:@"_restId"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    
//    _sessionId = [aDecoder decodeObjectForKey:@"sessionId"];
//    
//    _username = [aDecoder decodeObjectForKey:@"username"];
//    
//    _status = [aDecoder decodeObjectForKey:@"status"];
    

    _defaultId = [aDecoder decodeObjectForKey:@"_defaultId"];
    _loginUsername = [aDecoder decodeObjectForKey:@"_loginUsername"];
    _loginPassword = [aDecoder decodeObjectForKey:@"_loginPassword"];
    _name = [aDecoder decodeObjectForKey:@"_name"];
    _mobile = [aDecoder decodeObjectForKey:@"_mobile"];
    _jobPic = [aDecoder decodeObjectForKey:@"_jobPic"];
    _jobStatus = [aDecoder decodeObjectForKey:@"_jobStatus"];
    _emerContact = [aDecoder decodeObjectForKey:@"_emerContact"];
    _address = [aDecoder decodeObjectForKey:@"_address"];
    _emerConTel = [aDecoder decodeObjectForKey:@"_emerConTel"];
    _restId = [aDecoder decodeObjectForKey:@"_restId"];
    
    
    return self;
}

-(NSString *)description

{   
    return [NSString stringWithFormat:@" Salt   %@ UpdateBy   %@ ResProvince   %@ AdrCity   %@ Name   %@  LoginUsername   %@ ResidenceAdr   %@ JobPic   %@ LoginPassword   %@ EmerConTel   %@ CreateBy   %@ Mobile   %@ PlainPassword   %@ AdrProvince   %@ StoreId   %@ SysdataType   %@ Gender   %@ JobStatus   %@ IdCard   %@ BarPath   %@ EmpStatus   %@ RestId   %@ IsSyn   %@ BelongRest   %@ SynVersion   %d ResCity   %@ AuthorizationMake   %@ Version   %d EmerContact   %@ Address   %@ AuthorizationCode   %@ EmpNum   %@ UpdateTime   %@ CreateTime   %@ ",
   self.salt ,
   self.updateBy ,
   self.resProvince ,
   self.adrCity ,
   self.name ,
   //self.empId ,
   self.loginUsername ,
   self.residenceAdr ,
   self.jobPic ,
   self.loginPassword ,
   self.emerConTel ,
   self.createBy ,
   self.mobile ,
   self.plainPassword ,
   self.adrProvince ,
   self.storeId ,
   self.sysdataType ,
   self.gender ,
   self.jobStatus ,
   self.idCard ,
   self.barPath ,
   self.empStatus ,
   self.restId ,
   self.isSyn ,
   self.belongRest ,
   self.synVersion ,
   self.resCity ,
   self.authorizationMake ,
   self.version ,
   self.emerContact ,
   self.address ,
   self.authorizationCode ,
   self.empNum ,
   self.updateTime ,
   self.createTime 
 ];
}

-(instancetype)initWithDefaultId:(NSString *)defaultId
                     oldPassword:(NSString *)oldPassword
                     newPassword:(NSString *)newPassword{
    
    if ((self = [super init])!=nil) {
        _defaultId = defaultId;
        _loginPassword = oldPassword;
        _plainPassword = newPassword;
        _salt = @"1";
        
    }
    return self;
}



-(instancetype)initWithDefaultId:(NSString *)defaultId
                          mobile:(NSString *)mobile
               authorizationCode:(NSString *)authorizationCode
                        password:(NSString *)password{
    
    if ((self = [super init])!=nil) {
        _defaultId = defaultId;
        _mobile = mobile;
        _authorizationCode = authorizationCode;
        _salt = @"2";
        _loginPassword = password;
        
    }
    return self;
    
    
}

@end
