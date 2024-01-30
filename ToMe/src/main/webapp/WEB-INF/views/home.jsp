<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>To me home</title>
</head>
<style>
/* 노멀라이즈 시작 */
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;   /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
  color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
.side-bar > ul ul {
  display: none;
}

/* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
body {
  height: 5000px;
}
/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 270px;
  --side-bar-height: 90vh;
}

.side-bar {
  position: fixed;    /* 스크롤을 따라오도록 지정 */
  background-color: #181317;
  width: var(--side-bar-width);
  height: 55px;
}

/* 아이콘 시작 */
.side-bar__icon-box {
  display: flex;
  justify-content: flex-end;
}

.side-bar__icon-1 {
  position: relative;
  width: 23px;
  height: 17px;
  margin: 15px;
  margin-top: 20px;
  transition: .5s;
}

:root {
  --side-bar__icon: .5s;
}
.side-bar__icon-1 > div {
  position: absolute;
  width: 100%;
  height: 20%;
  background-color: #aeadaa;
  transition: all var(--side-bar__icon);
}
.side-bar__icon-1 > div:nth-of-type(1) {
  top: 0;
  width: auto;
  left: 0;
  right: 0;
  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), right calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2), height calc(var(--side-bar__icon) / 2) 0s;
}
.side-bar__icon-1 > div:nth-of-type(2) {
  top: 40%;
  transform-origin:bottom left;
}
.side-bar__icon-1 > div:nth-of-type(3) {
  top: 80%;
  left: auto;
  right: 0;
  transform-origin:bottom right;
}
.side-bar:hover .side-bar__icon-1 {
  transform: translate(-198px, 0);
}
.side-bar:hover .side-bar__icon-1 > div:nth-of-type(2) {
  transform:rotate(45deg);
  width: 70.5%;
  height: 25%;
}
.side-bar:hover .side-bar__icon-1 > div:nth-of-type(3) {
  top: 40%;
  transform:rotate(-45deg);
  width: 70.5%;
  height: 25%;
}
.side-bar:hover .side-bar__icon-1 > div:nth-of-type(1) {
  left: 41%;
  right: 41%;
  height: 100%;
  transition: all var(--side-bar__icon), left calc(var(--side-bar__icon) / 2) 0s, right calc(var(--side-bar__icon) / 2) 0s, height calc(var(--side-bar__icon) / 2) calc(var(--side-bar__icon) / 2);
}
/* 아이콘 끝 */
/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul > li > a {
  display: block;
  color: #74736e;
  font-size: 1.4rem;
  font-weight: bold;
  padding-top: 20px;
  padding-bottom: 20px;
  padding-left: 50px;
  transition: .5s;
}
/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar > ul > li {
  position: relative;
}
/* 모든 메뉴가 마우스 인식 시 반응 */
.side-bar ul > li:hover > a {
  background-color: #ededec;
  border-bottom: 1px solid #999;
}
/* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
.side-bar > ul > li:hover > ul {
  display: block;
  position: absolute;
  background-color: #ededec;
  top: 0;         /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
  left: 100%;     /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
  width: 100%;    /* 1차 메뉴의 너비를 상속 */
}
/* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
.side-bar {
  border-radius: 20px;
  transform: translate(calc(var(--side-bar-width) * -0.8), 0);
  transition: .5s;
}
/* 마우스 인식 시 원래의 위치로 이동 */
.side-bar:hover {
  transform: translate(-20px, 0);   /* 둥근 모서리의 너비만큼 숨겨주기 */
}
/* 사이드바 끝 */
/* 커스텀 끝 */
</style>
<body>
<aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="#"><i class="fa-solid fa-cat"></i> ${siteUserInfo.name}</a>
    </li>
    <li>
      <a href="#">개인 홈</a>
    </li>
    <li>
      <a href="#">로그아웃</a>
    </li>
  </ul>
</aside>
<section>
<img style="display: block; object-fit: cover; border-radius: 0px; width: 100%; height: 30vh; opacity: 1; object-position: center 70%;" src="https://www.notion.so/images/page-cover/webb2.jpg">
<div style="justify-content: center; display: flex;">
<h1>HOME</h1>
</div>
<div style="justify-content: center; display: flex;">
<ul>
<li>일기</li>
<li>작업목록</li>
<li>독서록</li>
</ul>
</div>
</section>
</body>
</html> 