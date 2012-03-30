package unit;

import models.BaseModel;
import models.LessonSystem;

import org.junit.Test;

import play.test.UnitTest;

public class schooltest extends UnitTest {
	@Test
    public void setLessonsystem(){
    	LessonSystem lessonSystem1 = new LessonSystem();
    	lessonSystem1.name = "少儿系列";
    	lessonSystem1.type = "eng";
    	lessonSystem1.state = BaseModel.ACTIVE;
    	lessonSystem1.description = "《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。" +
    			"《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！";
    	lessonSystem1.save();
    	LessonSystem lessonSystem2 = new LessonSystem();
    	lessonSystem2.name = "新概念系列";
    	lessonSystem2.type = "eng";
    	lessonSystem2.state = BaseModel.ACTIVE;
    	lessonSystem2.description = "作为一套世界闻名的英语教程，《新概念英语》以其全新的教学理念，有趣的课文内容和全面的技能训练，深受广大英语学习者的欢迎和喜爱。进入中国以后，《新概念英语》历经了数次重印，而为了最大限度地满足不同层次、不同类型英语学习者的需求，与本教程相配套的系列辅导用书和音像产品也是林林总总，不一而足。";
    	lessonSystem2.save();
    	LessonSystem lessonSystem3 = new LessonSystem();
    	lessonSystem3.name = "剑桥系列";
    	lessonSystem3.type = "eng";
    	lessonSystem3.state = BaseModel.ACTIVE;
    	lessonSystem3.description = "《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。" +
    			"《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！";
    	lessonSystem3.save();
    	LessonSystem lessonSystem4 = new LessonSystem();
    	lessonSystem4.name = "口语系列";
    	lessonSystem4.type = "eng";
    	lessonSystem4.state = BaseModel.ACTIVE;
    	lessonSystem4.description = "《剑桥国际儿童英语》（Playway to English）是针对母语非英语国家的初学英语的儿童出版的一套综合教材。以3 ～ 7岁儿童英语启蒙学习为主，分为四个级别。其最基本的特点在于寓教于乐，让孩子在愉快的游戏和优美的歌谣中掌握英语。" +
    			"《剑桥国际儿童英语》独创的SMILE教学法让孩子在轻松的学习环境中掌握基本的听、说、读、写能力。内容采用孩子乐于接受的短剧、动画片、歌曲、歌谣、韵律诗和行动故事来呈现。有趣的画面、活泼的节奏以及手脑并用的动作调动了孩子的多个感官，让孩子以母语的方式习得英语！";
    	lessonSystem4.save();
    }
}
