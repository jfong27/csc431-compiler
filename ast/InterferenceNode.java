package ast;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class InterferenceNode {

   private int edges;
   private int armRegister;
   private String regName;
   private Set<InterferenceNode> neighbors;
   private boolean spilled;

   public InterferenceNode(String regName) {
      this.regName = regName;
      this.neighbors = new HashSet<>();
      this.armRegister = -1;
      this.spilled = false;
   }

   public Set<InterferenceNode> getNeighbors() {
      return neighbors;
   }

   public String getName() {
      return regName;
   }

   public int numEdges() {
      return edges;
   }

   public boolean isSpilled() {
      return spilled;
   }

   public void spill() {
      spilled = true;
   }

   public void setArmRegister(int regNum) {
      armRegister = regNum;
   }

   public int getArmRegister() {
      return armRegister;
   }

   public void removeNeighbor(InterferenceNode neighbor) {
      neighbors.remove(neighbor);
      edges -= 1;
   }

   public void addNeighbor(InterferenceNode neighbor) {
      neighbors.add(neighbor);
      edges += 1;
   }

   public String toString() {
      StringBuilder sb = new StringBuilder(regName);
      sb.append("(");
      sb.append(armRegister);
      sb.append(") : [");
      for (InterferenceNode neighbor : neighbors) {
         sb.append(neighbor.getName() + ", ");
      }
      if (sb.length() > 5) {
         sb.delete(sb.length() - 2, sb.length());
      }
      sb.append("]");
      return sb.toString();
   }

   @Override
   public boolean equals(Object o) {
      if (o == this) { return true; }
      if (!(o instanceof InterferenceNode)) {
         return false;
      }
      return (regName.equals(((InterferenceNode)o).getName()));
   }

   @Override
   public int hashCode() {
      return Objects.hash(regName);
   }
   
}
