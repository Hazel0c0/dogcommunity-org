package company.friendsdog.dogcommunity.repository;

import company.friendsdog.dogcommunity.entity.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {
    //저장 삭제 수정
    //select  조회 같은경우 객체를가져옴 => List
    //void는 뭐를 리턴 x 수행만 하면됨
    // 담배피고 와  보고x
    //boolean 뭐를 리턴 o 예/아니오
    //담배피고 외 보고 o

    //댓글 등록
    boolean save(Reply reply);

    // 사용자 가 ?
    //댓글 개별 조회
    Reply findOne(long replyNo);

    //댓글 전체 조회
    List<Reply>findAll(long boardNo);


    //댓글 삭제
    boolean remove(long replyNo);

    //댓글 수정
    boolean modify(Reply reply);

    //댓글 수 조회

    int count (long boardNo);


}
