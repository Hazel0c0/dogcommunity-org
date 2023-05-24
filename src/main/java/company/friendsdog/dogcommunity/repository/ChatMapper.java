package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Board;
import company.friendsdog.dogcommunity.entity.Chat;
import company.friendsdog.dogcommunity.entity.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {

    boolean save(Chat chat);
}
