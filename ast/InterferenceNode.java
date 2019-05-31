package ast;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class InterferenceNode {

   private int edges;
   private String regName;
   private Set<InterferenceNode> neighbors;

   public InterferenceNode(String regName) {
      this.regName = regName;
      this.neighbors = new HashSet<>();
   }

   public String getName() {
      return regName;
   }

   public int numEdges() {
      return edges;
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
      StringBuilder sb = new StringBuilder("[");
      for (InterferenceNode neighbor : neighbors) {
         sb.append(neighbor.getName() + ", ");
      }
      if (sb.length() > 1) {
         sb.delete(sb.length() - 2, sb.length());
         sb.append("]");
      }
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
