package org.bowling;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BowlingJsp extends HttpServlet {
    private int frameCounter = 1;
    Map<Integer, List<Integer>> scoreMap = new HashMap<>();
    Map<Integer, List<Integer>> strikeMap = new HashMap<>();

    Frame[] frames = new Frame[]{
            new Frame(1),
            new Frame(2),
            new Frame(3),
            new Frame(4),
            new Frame(5),
            new Frame(6),
            new Frame(7),
            new Frame(8),
            new Frame(9),
            new Frame(10)};

    PinButton[] pinButton = new PinButton[]{
            new PinButton("0"),
            new PinButton("1"),
            new PinButton("2"),
            new PinButton("3"),
            new PinButton("4"),
            new PinButton("5"),
            new PinButton("6"),
            new PinButton("7"),
            new PinButton("8"),
            new PinButton("9"),
            new PinButton("10")};

    public PinButton[] getPinButton() {
        return pinButton;
    }

    public Frame[] getFrames() {
        return frames;
    }

    private String getFramesAsJson() {
     List<String> contentList = new ArrayList<>();
      for (Frame frame : frames) {
          contentList.add(frame.toString());
      }
      return contentList.toString();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("bowlingscoring.jsp");
        String pindownlistStr = request.getParameter("pinDownList");
        String[] pindownList = pindownlistStr.split(",");
        for(String scoreValue : pindownList) {
            handle(scoreValue);
        }
        this.getFrames();
        this.getPinButton();
        PrintWriter printWriter = response.getWriter();
        printWriter.write(this.getFramesAsJson());
        //requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    public void handle(String currentScore) {
        int pinDown = Integer.valueOf(currentScore);
        addFurtherThrowToStrikeMap(pinDown);
        checkIfTimeForStrikeScore();
        Frame frame = frames[frameCounter - 1];
        //first throw this frame
        if (!scoreMap.containsKey(frameCounter - 1)) {
            scoreMap.put(frameCounter - 1, new ArrayList<>());
            frame.setButtonContentByIdx(0, currentScore);
            //the previous has spare
            if (frameCounter >= 2 && frames[frameCounter - 2].hasSpare) {
                frames[frameCounter - 2].getScorCell().setText(String.valueOf(frames[frameCounter - 2].caculateScore(pinDown)));
            }
            disableButtonByLeftedPins(pinDown);
        }
        if (scoreMap.get(frameCounter - 1).size() == 1) {
            frame.setButtonContentByIdx(2, currentScore);
        }

        scoreMap.get(frameCounter - 1).add(pinDown);

        if (frame.hasStrike && frameCounter != 10) {
            strikeMap.put(frameCounter - 1, new ArrayList<>());
            frameCounter++;
            return;
        }
        //after two throws, time to give the score for this frame
        if (scoreMap.get(frameCounter - 1).size() >= 2) {
            resetPinButton();
            if (!frame.hasStrike && !frame.hasSpare) {
                int scores = frame.caculateScore(pinDown);
                frame.getScorCell().setText(String.valueOf(scores));
            }
            if (frameCounter != 10) {
                frameCounter++;
            } else {
                //the 10 th frame
                if (frame.hasStrike) {
                    disableButtonByLeftedPins(pinDown);
                }
                if (scoreMap.get(frameCounter - 1).size() == 3) {
                    frame.setButtonContentByIdx(3, currentScore);
                    frame.getScorCell().setText(String.valueOf(frame.caculateScore(pinDown)));
//                        for (ScoreCell pinButton : pinButton) {
//                            pinButton.removeEventHandler(ActionEvent.ACTION, this);
//                        }
                }
            }
        }
    }

    class Frame {
        private int idx;
        private ScoreCell[] cells;
        private boolean hasStrike = false;
        private boolean hasSpare = false;

        Frame(int idx) {
            cells = new ScoreCell[4];
            for (int i = 0; i < cells.length; ++i) {
                cells[i] = new ScoreCell();
            }
        }

        ScoreCell getScorCell() {
            return cells[1];
        }

        void setButtonContentByIdx(int cellIdx, String pinDown) {
            cells[cellIdx].setText(pinDown);
            if (cellIdx == 2) {
                int scoresThrow1 = scoreMap.get(frameCounter - 1).stream().mapToInt(Integer::intValue).sum();
                int scores = scoresThrow1 + Integer.valueOf(pinDown);
                if (scores == 10) {
                    cells[cellIdx].setText("/");
                    hasSpare = true;
                    return;
                }
            }
            if (Integer.valueOf(pinDown) == 0) {
                cells[cellIdx].setText("-");
                return;
            }
            if (Integer.valueOf(pinDown) == 10) {
                cells[cellIdx].setText("X");
                hasStrike = true;
                return;
            }
        }

        private int caculateScore(int pinDown) {
            if (hasSpare) {
                int scorePreviousValue = frameCounter >= 3 ? Integer.valueOf(frames[frameCounter - 3].getScorCell().getText()) : 0;
                int scoreBonus = 10 + pinDown;
                return scoreBonus + scorePreviousValue;
            } else {
                int scores = scoreMap.get(frameCounter - 1).stream().mapToInt(Integer::intValue).sum();
                int scorePreviousValue = frameCounter >= 2 ? Integer.valueOf(frames[frameCounter - 2].getScorCell().getText()) : 0;
                return scores + scorePreviousValue;
            }
        }

        @Override
        public String toString() {
            return "idx" + idx + "content" + cells[idx].text;
        }
    }

    class ScoreCell {
        private String text;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }
    }

    class PinButton {
        PinButton(String text) {
            this.text = text;
        }

        private String text;

        public String getText() {
            return text;
        }

        private boolean disabled;

        public void setDisabled(boolean disabled) {
            this.disabled = disabled;
        }

        public boolean isDisabled() {
            return disabled;
        }
    }

    private void disableButtonByLeftedPins(int pinDown) {
        int leftedPins = 10 - Integer.valueOf(pinDown);
        for (PinButton pb : pinButton) {
            if (Integer.valueOf(pb.getText()) > leftedPins && pinDown != 10) {
                pb.setDisabled(true);
            }
        }
    }

    private void resetPinButton() {
        for (PinButton pb : pinButton) {
            pb.setDisabled(false);
        }
    }

    private void addFurtherThrowToStrikeMap(int pinDown) {
        for (Map.Entry entry : strikeMap.entrySet()) {
            ((List) entry.getValue()).add(pinDown);
        }
    }

    private void checkIfTimeForStrikeScore() {
        for (Map.Entry entry : strikeMap.entrySet()) {
            if (((List) entry.getValue()).size() == 2) {
                int frameIdx = (int) entry.getKey();
                int scoreNextThrows = ((List<Integer>) entry.getValue()).stream().mapToInt(Integer::intValue).sum();
                int previousScore = (frameIdx >= 1 && !frames[frameIdx - 1].getScorCell().getText().isEmpty()) ?
                        Integer.valueOf(frames[frameIdx - 1].getScorCell().getText()) : 0;
                frames[frameIdx].getScorCell().setText(String.valueOf(scoreNextThrows + 10 + previousScore));
            }
        }
    }

    private void reset() {
        frameCounter = 1;
        scoreMap = new HashMap<>();
        strikeMap = new HashMap<>();
        resetPinButton();
        //resetFrame();
    }
}
