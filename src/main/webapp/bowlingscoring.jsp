<!doctype html>
<html>
<head>
  <style>
   table.scoring {border: 1px solid #FFAA33; border-right:none;  border-collapse: collapse;}
   table.scoring td {border-right: 1px solid #FFAA33;width:30px !important; height: 30px !important; text-align: center;}
   table.frame {margin-left:10px;}
   table.frame th {text-align:left;}
   button.scoringbtn {height: 30px; width: 30px;}
</style>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
    <h2>Bowlingsocring Sheet</h2>
<table style="margin-left:10px;">
  <tbody>
  <tr>
    <td>
      <button id="b0" class="scoringbtn">0</button>
      <button id="b1" class="scoringbtn">1</button>
      <button id="b2" class="scoringbtn">2</button>
      <button id="b3" class="scoringbtn">3</button>
      <button id="b4" class="scoringbtn">4</button>
      <button id="b5" class="scoringbtn">5</button>
      <button id="b6" class="scoringbtn">6</button>
      <button id="b7" class="scoringbtn">7</button>
      <button id="b8" class="scoringbtn">8</button>
      <button id="b9" class="scoringbtn">9</button>
      <button id="b10" class="scoringbtn">10</button>
    </td>
  </tr>
  </tbody>
</table>

<table class="frame" style="margin-top:40px;">
  <tbody>
  <tr>
    <th >1</th>
    <th >2</th>
    <th >3</th>
    <th >4</th>
    <th >5</th>
    <th >6</th>
    <th >7</th>
    <th >8</th>
    <th >9</th>
    <th>10</th>
  </tr>
  <tr>
    <td>
      <table class="scoring">
        <tr>
          <td id = "scorecell1-1">&nbsp;</td> <td id = "scorecell1-3">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td>
      <table class="scoring">
        <tr>
          <td id ="scorecell2-1">&nbsp;</td> <td id ="scorecell2-3">&nbsp;</td>

        </tr>
      </table>
    </td>    <td>
    <table class="scoring">
      <tr>
        <td id ="scorecell3-1">&nbsp;</td> <td id ="scorecell3-3">&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
       <td id ="scorecell4-1">&nbsp;</td> <td id ="scorecell4-3">&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td id ="scorecell5-1">&nbsp;</td> <td id ="scorecell5-3">&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
      <td id ="scorecell6-1">&nbsp;</td> <td id ="scorecell6-3">&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td id ="scorecell7-1">&nbsp;</td> <td id ="scorecell7-3">&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
          <td id ="scorecell8-1">&nbsp;</td> <td id ="scorecell8-3">&nbsp;</td>

      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
         <td id ="scorecell9-1">&nbsp;</td> <td id ="scorecell9-3">&nbsp;</td>
      </tr>
    </table>
  </td>    <td>
    <table class="scoring">
      <tr>
        <td id ="scorecell10-1">&nbsp;</td> <td id ="scorecell10-3">&nbsp;</td>
        <td id ="scorecell10-4">&nbsp;</td>
      </tr>
    </table>
  </td>
  <tr>
   <td>
      <table class="scoring">
        <tr>
          <td id = "scorecell1-2">&nbsp;</td> <td id = "scorecell1-4">&nbsp;</td>
        </tr>
      </table>
    </td>
      <td>
        <table class="scoring">
          <tr>
            <td id = "scorecell2-2">&nbsp;</td> <td id = "scorecell2-4">&nbsp;</td>
          </tr>
        </table>
      </td>
      <td>
        <table class="scoring">
          <tr>
           <td id = "scorecell3-2">&nbsp;</td> <td id = "scorecell3-4">&nbsp;</td>

          </tr>
        </table>
      </td>    <td>
      <table class="scoring">
        <tr>
           <td id = "scorecell4-2">&nbsp;</td> <td id = "scorecell4-4">&nbsp;</td>
        </tr>
      </table>
    </td>    <td>
      <table class="scoring">
        <tr>
           <td id = "scorecell5-2">&nbsp;</td> <td id = "scorecell5-4">&nbsp;</td>
        </tr>
      </table>
    </td>    <td>
      <table class="scoring">
        <tr>
           <td id = "scorecell6-2">&nbsp;</td> <td id = "scorecell6-4">&nbsp;</td>

        </tr>
      </table>
    </td>    <td>
      <table class="scoring">
        <tr>
          <td id = "scorecell7-2">&nbsp;</td> <td id = "scorecell7-4">&nbsp;</td>

        </tr>
      </table>
    </td>    <td>
      <table class="scoring">
        <tr>
         <td id = "scorecell8-2">&nbsp;</td> <td id = "scorecell8-4">&nbsp;</td>
        </tr>
      </table>
    </td>
    <td>
      <table class="scoring">
        <tr>
         <td id = "scorecell9-2">&nbsp;</td> <td id = "scorecell9-4">&nbsp;</td>
        </tr>
      </table>
    </td>    <td>
      <table class="scoring">
        <tr>
          <td id = "scorecell10-2">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody>
</table>

</body>
<button id ="reset" style="margin-left:20px;">reset</button>
<span id="displayScore"> ${score} </span>
</html>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var pinDownList = '';
     var scoringBtns = document.getElementsByClassName("scoringbtn");
     for (var i = 0; i < scoringBtns.length; i++) {
      document.getElementById(scoringBtns.item(i).id).addEventListener('click', function() {
            var btnId = this.id;
            btnId = btnId.replace('b', '');
            var contentToAdd = pinDownList.length === 0? btnId : ',' + btnId;
            pinDownList = pinDownList + contentToAdd;
            $.ajax({
    url: window.location + 'scoring',
    data: { 
        "pinDownList": pinDownList
    },
    cache: false,
    type: "GET",
    success: function(response) {
        var objectAry = JSON.parse(response);
        var frameAry = objectAry['frame'];
        for (var key in frameAry) {
          var cellObject = frameAry[key];
          var idx = cellObject.idx;
          var cellIdx = 1;
          for (var i = 0; i < cellObject.content.length; i++) {
          var cellValue = cellObject.content[i];
           var calculatedId = 'scorecell' + idx + '-' + cellIdx;
           var tableCell = document.getElementById(calculatedId);
           if (tableCell != undefined) {
             tableCell.innerHTML = cellValue !== 'null'
                      && cellValue !== null
                      && cellValue !== undefined
                      && cellValue.length !== 0? cellValue : '&nbsp;';
           }
           cellIdx++;
          }
        }
        var pinbuttonAry = objectAry['pinbutton'];
        for (var key in pinbuttonAry) {
          var pinbuttonObject = pinbuttonAry[key];
          var idx = pinbuttonObject.idx;
          var disabled = pinbuttonObject.disabled;
          var calculatedId = 'b' + idx;
           var pinButton = document.getElementById(calculatedId);
           if (pinButton != undefined) {
             pinButton.disabled = disabled;
         
           }
        }
    },
    error: function(xhr) {
    }
      });
    });
}
document.getElementById('reset').addEventListener('click', function() {
 pinDownList = '';
       $.ajax({
       url: window.location + 'scoring',
       data: {
           "pinDownList": pinDownList
       },
       cache: false,
       type: "GET",
       success: function(response) {
       window.location.reload();
       },
       error: function(xhr) {
       }
         });
});

</script>
