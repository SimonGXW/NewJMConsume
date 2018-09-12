
var now_page = 1;
dic_head = {
    Company: "所属公司",
    RoName: "角色名称",
    RoRemark: "备注",
    RoIsValid: "是否启用",
}

$(document).ready(function () {
    load(true, 1);
    //bindpaginator(10)
})

//加载页面
function load(isfirst, pc) {
    var status = $("input[name='statusRadio']:checked").val();
    var keyword = $("#keyword").val();
    var company = $("#company").val();
    var jsonObj = {
        type: "set_role_load",
        status: status,
        company: company,
        keyword: keyword,
        pc:pc
    }
    if (isfirst) {
        now_page = 1;
    }
    else {
        now_page = pc;
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_load);

}
//加载页面的回调
function callBack_load(data) {
    if (data.result == "ok") {
        $("#table").empty();
        if (data.execDt.length != 0) {
            generateTable(data.execDt,dic_head);
        }
        bindpaginator(data.numcount);
    }
}

//新建表
function generateTable(data, dic) {
    var table = document.getElementById("table");
    table.appendChild(generateTableThead(dic))
    var tbody = document.createElement("tbody");
    for (var i = 0; i < data.length; i++) {
        tbody.appendChild(generateTableRow(data[i], dic, i));
    }
    table.appendChild(tbody);
}
//制作表头
function generateTableThead(dic) {
    var thead = document.createElement("thead");
    var tr = document.createElement("tr");
    for (index in dic) {
        var th = document.createElement("th");
        th.innerHTML = dic[index];
        tr.appendChild(th);
    }
    var th2 = document.createElement("th");
    th2.innerHTML = "操作";
    tr.appendChild(th2);
    thead.appendChild(tr);
    return thead;
}
//新建一行
function generateTableRow(data, dic, i) {
    var tr = document.createElement("tr");
    tr.setAttribute("name", data["RoId"]);
    for (index in dic) {
        var td = document.createElement("td");
        if (index == "RoIsValid") {
            if (data["RoIsValid"] == "1") {
                td.innerHTML = "启用";
            }
            else {
                td.innerHTML = "停用";
            }
            tr.appendChild(td);
        }
        else {
            td.innerHTML = data[index];
            tr.appendChild(td);
        }
    }
    var td2 = document.createElement("td");
    td2.innerHTML = checkStatus(data["RoIsValid"]);
    tr.appendChild(td2);

    return tr;
}

//判断操作是否为启用或停用
function checkStatus(isuse) {
    var str = "";
    if (isuse == "1") {
        str = "<a onclick=\"setRole(this)\" name=" + isuse + ">停用角色</a>";
    }
    else if (isuse == "0") {
        str = "<a onclick=\"setRole(this)\" name=" + isuse + ">启用角色</a>";
    }
    else {
        str = ""
    }
    return str;
}
//启用或停用角色
function setRole(obj) {
    var id = obj.parentNode.parentNode.getAttribute("name");
    var status = obj.name;
    var jsonObj = {
        type: "set_role_update",
        id: id,
        status: status
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_set);
}
function callBack_set(data) {
    if (data.result == "success") {
        alert("修改成功！");
        load(false, 1);
    }
}

//添加角色
function addRole() {
    var company = $("#addcompany").val();
    var role = $("#addrole").val();
    var remark = $("#addremark").val();
    var jsonObj = {
        type: "set_role_addrole",
        company: company,
        role: role,
        remark: remark
    }
    var postStr = JSON.stringify(jsonObj);
    mj_ajax("SettingBack.ashx", "json", postStr, callBack_addRole);
}
//添加角色回调
function callBack_addRole(data) {
    alert(data.msg);
}
//分页插件
function bindpaginator(tatal) {
    var tp = Math.ceil(tatal / 10)
    $('#pageLimit').bootstrapPaginator({
        currentPage: now_page,//当前的请求页面。
        totalPages: tp,//一共多少页。
        size: "normal",//应该是页眉的大小。
        bootstrapMajorVersion: 3,//bootstrap的版本要求。
        alignment: "right",
        numberOfPages: 10,//一页列出多少数据。
        itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
            switch (type) {
                case "first": return "首页";
                case "prev": return "上一页";
                case "next": return "下一页";
                case "last": return "末页";
                case "page": return page;
            }
        },
        onPageClicked: function (event, originalEvent, type, page) {
            load(false, page);
        }
    });

}
