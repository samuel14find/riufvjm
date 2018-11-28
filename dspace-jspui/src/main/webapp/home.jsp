<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.app.webui.components.RecentSubmissions" %>


<%@page import="org.dspace.browse.ItemCounter" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="org.dspace.content.Bitstream" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.content.Item" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.core.Utils" %>
<%@ page import="javax.servlet.jsp.jstl.core.Config" %>
<%@ page import="java.util.Locale" %>

<%
    Community[] communities = (Community[]) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);

    /* String topNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html")); */
    /* String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html")); */

    boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled) {
        feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
    }

    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
%>


<%--
	<div class="jumbotron">
        <%= topNews %>
	</div>
--%>

<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">

    <div class="container">
        <div class="pull-right" style="margin-top: 50px;">
                <%-- Escolhe idioma--%>
            <a onclick="javascript:document.repost.locale.value='pt_BR';document.repost.submit();"
               href="<%= request.getContextPath() %>?locale=pt_BR">
                <img src="<%= request.getContextPath() %>/image/br.png" height="25">
            </a>
            <a onclick="javascript:document.repost.locale.value='en';document.repost.submit();"
               href="<%= request.getContextPath() %>?locale=en">
                <img src="<%= request.getContextPath() %>/image/us.png" height="25">
            </a>
            <a onclick="javascript:document.repost.locale.value='es';document.repost.submit();"
               href="<%= request.getContextPath() %>?locale=es">
                <img src="<%= request.getContextPath() %>/image/es.png" height="25">
            </a>
        </div>

        <form method="get" action="<%= request.getContextPath() %>/simple-search"
              class="form-horizontal col-md-12 form-group form-group-lg" scope="search" role="form">

            <div id="logo-deposita" class="text-center">
                <a id="link-logo-deposita" href="<%= request.getContextPath() %>/community-list">
                    <img width="632" height="212" src="<%= request.getContextPath() %>/image/LogoRepositorio.gif"
                         usemap="#mapa-brasil">
                </a>
            </div>


            <div class="col-md-12 searchbox">
                <div class="col-md-11">
                    <input type="text" class="form-control "
                           placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query"
                           id="tequery-main-page" size="25"/>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary pull-right search-button"><span
                            class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>


        </form>

        <div class="container row">

            <% request.setAttribute("createRootDiv", false); %>


            <%@ include file="discovery/static-sidebar-facet.jsp" %>
        </div>
    </div>
</dspace:layout>
