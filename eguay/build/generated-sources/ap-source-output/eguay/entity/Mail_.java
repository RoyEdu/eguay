package eguay.entity;

import eguay.entity.Auction;
import eguay.entity.Groups;
import eguay.entity.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-04-21T08:52:01")
@StaticMetamodel(Mail.class)
public class Mail_ { 

    public static volatile SingularAttribute<Mail, Date> sentDate;
    public static volatile ListAttribute<Mail, Users> usersList;
    public static volatile SingularAttribute<Mail, Users> senderid;
    public static volatile ListAttribute<Mail, Auction> auctionList;
    public static volatile SingularAttribute<Mail, String> subject;
    public static volatile SingularAttribute<Mail, Long> mailid;
    public static volatile ListAttribute<Mail, Groups> groupsList;
    public static volatile SingularAttribute<Mail, String> body;

}